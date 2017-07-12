export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";
import { getTodos, postTodo, patchTodo } from '../util/todo_api_util.js';
import { receiveErrors } from './error_actions.js';

export const receiveTodos = (todos) => ({
  type: RECEIVE_TODOS,
  todos
});

export const receiveTodo = todo => ({
  type: RECEIVE_TODO,
  todo
});

export const removeTodo = todo => ({
  type: REMOVE_TODO,
  todo
});

export const fetchTodos = () => dispatch => (
  getTodos().then(todos => dispatch(receiveTodos(todos)))
);

export const createTodo = (formTodo) => dispatch => (
  postTodo(formTodo).then(todo => dispatch(receiveTodo(todo)),
                          err => dispatch(receiveErrors(err.responseJSON)))
);

export const updateTodo = (formTodo) => dispatch => (
  patchTodo(formTodo).then(todo => dispatch(receiveTodo(todo)),
                          err => dispatch(receiveErrors(err.responseJSON)))
);
