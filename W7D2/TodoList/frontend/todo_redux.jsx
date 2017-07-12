import React from 'react';
import ReactDOM from 'react-dom';
import store from './store/store.js';
import { allTodos } from './reducers/selectors.js';
import { receiveTodos, receiveTodo, fetchTodos } from './actions/todo_actions.js';
import App from './components/app.jsx';
import Root from './components/root.jsx';

document.addEventListener('DOMContentLoaded', () => {
	const root = document.getElementById('root');
	ReactDOM.render(<Root store={store}/>, root);
  window.store = store;
  window.allTodos = allTodos;
  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
	window.fetchTodos = fetchTodos;
});
