import Root from'./components/root';
import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import { login } from './actions/session_actions';


document.addEventListener('DOMContentLoaded', () => {

  let store;
  if (window.currentUser) {
    const preloadedState = { session: { currentUser: window.currentUser } };
    store = configureStore(preloadedState);
    delete window.currentUser;
  } else {
    store = configureStore();
  }

  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store}/>, root);

  // TESTING
  window.user = {
    username: 'bob',
    password: 'password'
  };

  window.getState = store.getState;
  window.dispatch = store.dispatch;
  window.login = login;
});
