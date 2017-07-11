import { createStore } from 'redux';
import reducer from '../reducers/root_reducer.js';

const configureStore = createStore(reducer);

export default configureStore;
