import React from 'react';
import ReactDOM from 'react-dom';
import { receiveAllPokemon, requestAllPokemon, requestSinglePokemon } from './actions/pokemon_actions';
import { getAllPokemon } from './util/api_util';
import configureStore from './store/store';
import { selectAllPokemon } from './reducers/selectors';
import Root from './components/root';
import { HashRouter, Route } from 'react-router-dom';

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
	const root = document.getElementById('root');
	ReactDOM.render(<Root store={store}/>, root);

  window.requestSinglePokemon = requestSinglePokemon;
  // window.receiveAllPokemon = receiveAllPokemon;
  // window.getAllPokemon = getAllPokemon;
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  // window.requestAllPokemon = requestAllPokemon;
  // window.selectAllPokemon = selectAllPokemon;
});
