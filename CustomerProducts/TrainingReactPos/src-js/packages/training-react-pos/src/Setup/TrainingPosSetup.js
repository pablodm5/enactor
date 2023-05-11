import React from "react";
import { applyMiddleware, createStore, combineReducers } from "redux";
import thunk from "redux-thunk";
import { connect, Provider } from "react-redux";
import { composeWithDevTools } from "redux-devtools-extension";
import {
	InventoryProvider,
	enactorInventoryReducerNamespace,
	enactorInventoryReducers
} from "@enactor/react-inventory";
// react-crm
import {
	CRMProvider,
	enactorCRMReducerNamespace,
	enactorCRMReducers
} from "@enactor/react-crm";
// react-pos
import {
	EnactorProvider as ReactPosProvider,
	DefaultDeviceSupport,
	ConnectedTranslationListener,
	ErrorBoundaryContainer
} from "@enactor/react-pos";

import {
	enactorPosReducerNamespace,
	enactorPosReducers
} from "@enactor/react-base-components";

//@enactor/redux-javascript-bridge
import {
	BRIDGE_STATUS_CONNECTED,
	enactorBridgeReducerNamespace,
	enactorBridgeReducers
} from "@enactor/redux-javascript-bridge";

// @enactor/react-javascript-bridge
import {
	JavascriptBridgeWrapper,
	PromptRendererContainer,
	PosConfigurationScreen
} from "@enactor/react-javascript-bridge";

//css
import "@enactor/react-pos/lib/main.css";

// import routes from "../configuration/Routes";
// import MockBaseComponentsMap from "../configuration/MockBaseComponentsMap";
// import InventoryComponentsMap from "../configuration/InventoryComponentsMap";
// import CRMComponentsMap from "../configuration/CRMComponentsMap";
// import ReactPosComponentsMap from "../configuration/ReactPosComponentsMap";

import {
	RenderedPromptWrapper,
	UserNotificationsListener,
	getPromptUrlsFromRoutes
} from "@enactor/react-base-components";

// Local Imports
import TrainingPosComponentsMap from "../Configuration/TrainingPosComponentsMap";
import TrainingBaseComponentsMap from "../Configuration/TrainingBaseComponentsMap";
import TrainingRoutes from "../Configuration/TrainingRoutes";


const reducers = combineReducers({
	[enactorPosReducerNamespace]: combineReducers(enactorPosReducers),
	[enactorBridgeReducerNamespace]: combineReducers(enactorBridgeReducers),
	[enactorInventoryReducerNamespace]: combineReducers(enactorInventoryReducers),
	[enactorCRMReducerNamespace]: combineReducers(enactorCRMReducers)
});

function configureStore(reducer) {
	const store = createStore(
		reducer,
		composeWithDevTools(applyMiddleware(thunk))
	);
	return store;
}
const store = configureStore(reducers);

const defaultConfig = {
	hostName: process.env.REACT_APP_ENACTOR_WEBSOCKET_BRIDGE_HOST,
	hostPort: process.env.REACT_APP_ENACTOR_WEBSOCKET_BRIDGE_PORT,
	deviceId: process.env.REACT_APP_ENACTOR_WEB_BRIDGE_DEVICE_ID,
	processSet: process.env.REACT_APP_ENACTOR_WEB_BRIDGE_PROCESS_SET,
	parentProcessSet: process.env.REACT_APP_ENACTOR_WEB_BRIDGE_PARENT_PROCESS_SET,
	processId: "Pos/ThinClientStartUp",
	webBridgeBaseUrl: process.env.REACT_APP_ENACTOR_WEB_BRIDGE_LOCAL_IMAGE_BASE
};

const configWithRoutes = {
	...defaultConfig,
	viewPromptUrls: getPromptUrlsFromRoutes(TrainingRoutes)
};

const TrainingPosSetup = () => {
	return (
		<Provider store={store}>
			<ConnectedReactPosProvider
				componentsMap={TrainingPosComponentsMap}
				baseComponents={TrainingBaseComponentsMap}
			>
					<JavascriptBridgeWrapper defaultConfig={configWithRoutes}>
						<UserNotificationsListener />
						<PosConfigurationScreen />
						<PromptRendererContainer
							routes={TrainingRoutes}
							deviceSupport={DefaultDeviceSupport}
							PromptWrapper={RenderedPromptWrapper}
							ErrorBoundaryComponent={ErrorBoundaryContainer}
						/>
						<ConnectedTranslationListener />
					</JavascriptBridgeWrapper>
			</ConnectedReactPosProvider>
		</Provider>
	);
};

const ConnectedReactPosProvider = connect((state, ownProps) => {
	const isConnected = state.enactorBridge.status === BRIDGE_STATUS_CONNECTED;
	return {
		isConnected,
		...ownProps
	};
}, null)(ReactPosProvider);

const ConnectedInventoryProvider = connect((state, ownProps) => {
	const isConnected = state.enactorBridge.status === BRIDGE_STATUS_CONNECTED;
	return {
		isConnected,
		...ownProps
	};
}, null)(InventoryProvider);

const ConnectedCRMProvider = connect((state, ownProps) => {
	const isConnected = state.enactorBridge.status === BRIDGE_STATUS_CONNECTED;
	return {
		isConnected,
		...ownProps
	};
}, null)(CRMProvider);

export default TrainingPosSetup;
