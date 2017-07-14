import { createStore, applyMiddleware } from 'redux';
import reducer from '../reducers/root_reducer';
import { logger } from 'redux-logger';
import thunk from '../middleware/thunk.js';

const configureStore = () => createStore(reducer, applyMiddleware(thunk));

export default configureStore;
