const webpack = require('webpack');
const path = require('path');
const CopyPlugin = require('copy-webpack-plugin');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const ManifestPlugin = require('webpack-manifest-plugin');
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const Dotenv = require('dotenv-webpack');
const generateSourceMaps = true;

const BUILD_DIR = path.resolve(__dirname, 'build');
const APP_DIR = path.resolve(__dirname, 'src');

const VENDOR_LIBS = ['react', 'react-dom'];

module.exports = {
  entry: {
    bundle: APP_DIR + '/index.js',
    vendor: VENDOR_LIBS
  },
  output: {
    path: BUILD_DIR,
    filename: 'static/[name].[chunkhash].js'
  },
  module: {
    rules: [
      {
        test: /.(js|jsx)$/,
        exclude: /node_modules/,
        loader: "babel-loader"
      },
      {
        test: /\.css$/i,
        use: ["style-loader", {
          loader: 'css-loader',
          options: {
            url: (url, resourcePath) => {
              // Don't handle enactor's local images specified as relative urls
              return !/^.\/images\/enactor\//.test(url);
            }
          }
        }, {
          loader: 'string-replace-loader',
          options: {
            search: 'url\\("/images/enactor',
            replace: 'url("./images/enactor',
            flags: 'g',
          }
        }]
      },
      {
        test: /\.scss$/i,
        use: ["style-loader", "css-loader" ,'sass-loader']
      },
      {
        test: /\.module\.s(a|c)ss$/,
        loader: [
          MiniCssExtractPlugin.loader,
          {
            loader: "css-loader",
            options: {
              modules: true,
              sourceMap: generateSourceMaps
            }
          },
          {
            loader: "sass-loader",
            options: {
              sourceMap: generateSourceMaps
            }
          }
        ]
      },
      {
        test: /\.s(a|c)ss$/,
        exclude: /\.module.(s(a|c)ss)$/,
        loader: [
          MiniCssExtractPlugin.loader,
          "css-loader",
          {
            loader: "sass-loader",
            options: {
              sourceMap: generateSourceMaps
            }
          }
        ]
      }
    ]
  },
  plugins: [
	  new Dotenv({
		  path: path.resolve(__dirname,'.env.production')
	  }),
    new HtmlWebpackPlugin({
      templateContent: `
    <!DOCTYPE html>
<html lang="en">
\t<head>
\t\t<meta charset="utf-8" />
\t\t<meta
\t\t\tname="viewport"
\t\t\tcontent="width=device-width, initial-scale=1, shrink-to-fit=no"
\t\t/>
\t\t<meta name="theme-color" content="#000000" />

\t\t<link rel="manifest" href="/manifest.json" />
\t\t<script src="js/polyfill.min.js"></script>
\t\t<script src="js/Intl-1.2.5.complete.js"></script>
\t\t<script src="js/Intl-1.2.5.complete.js"></script>

\t\t<title>React App</title>
\t</head>

\t<body id="body" class="body">
\t\t<noscript>
\t\t\tYou need to enable JavaScript to run this app.
\t\t</noscript>
\t\t<div id="root"></div>

\t\t<script src="js/jquery.min.js"></script>
\t\t<script src="js/main.js"></script>
\t</body>
</html>
  `
    }),
    new ManifestPlugin({
      fileName: 'manifest.json'
    }),
    new CopyPlugin({
      patterns: [
        {from: 'public/images', to: 'images'},
        {from: 'public/js', to: 'js'},
        {from: 'public/NextGen1024x768', to: 'NextGen1024x768'}
      ],
    }),
  ],
  optimization: {
    splitChunks: {
      chunks: 'all',
    },
  },
};
