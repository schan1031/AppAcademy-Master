import merge from 'lodash/merge';
import { RECEIVE_TODO, RECEIVE_TODOS, REMOVE_TODO } from '../actions/todo_actions.js';

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  },
};

const todosReducer = (state = {}, action) => {
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_TODOS:
      const newState = {};
      const keys = Object.keys(action.todos);
      keys.forEach((el) => {
        let todo = action.todos[el];
        newState[todo.id] = todo;
      });
      return newState;
    case RECEIVE_TODO:
      let nextState = merge({}, state);
      const todo = action.todo;
      nextState[todo.id] = todo;
      return nextState;
    case REMOVE_TODO:
      let dupe = merge({}, state);
      delete dupe[action.todo.id];
      return dupe;
    default:
      return state;
  }
};

export default todosReducer;
