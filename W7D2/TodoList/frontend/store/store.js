import { createStore } from 'redux';
import reducer from '../reducers/root_reducer.js';
import { applyMiddleware } from 'redux';
import thunk from '../middleware/thunk.js';

const configureStore = createStore(reducer, applyMiddleware(thunk));

export default configureStore;
