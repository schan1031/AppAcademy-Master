import todosReducer from './todos_reducer.js';
import { combineReducers } from 'redux';

const rootReducer = combineReducers({
  todos: todosReducer
});

export default rootReducer;
