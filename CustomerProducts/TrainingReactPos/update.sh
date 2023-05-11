#! /bin/bash

# Filename: 	update.sh
# Purpose:		To rename the version of react pos packages which are downloaded from Enactor Verdaccio Server(http://192.168.1.118:4873/ )
# Creaated by:	Amila Senadheera
# Created date:	27th April 2021


# Find the latest package version according to the required branch(version name starts with the branch name) published in Enactor Verdaccio Server
# pass it as the first argument to this script

error_exit () {
   echo $1
   exit 1
}

replaceTextInFile() {
	echo "Replacing $1 with $2"
    if [ "${OS_NAME}" == "Darwin" ]; then
        find . -type f ! -name 'update.sh' -exec sed -i '' "s/$1/$2/"  {} \;
    else
        find . -type f ! -name 'update.sh' -exec sed -i'' "s/$1/$2/" {} \;
    fi
}

if [ -z ${1} ]; then
    error_exit "Version of React Pos packages not provided"
fi

replaceTextInFile "ReactPosPackagesVersion" "$1"