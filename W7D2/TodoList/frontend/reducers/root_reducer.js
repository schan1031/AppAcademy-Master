import todosReducer from './todos_reducer.js';
import errorReducer from './error_reducer.js';
import { combineReducers } from 'redux';


const rootReducer = combineReducers({
  todos: todosReducer,
  errors: errorReducer
});

export default rootReducer;
