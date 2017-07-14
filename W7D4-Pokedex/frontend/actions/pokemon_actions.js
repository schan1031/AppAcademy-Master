export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';
export const RECEIVE_SINGLE_POKEMON = 'RECEIVE_SINGLE_POKEMON';

import {getAllPokemon, getOnePokemon} from '../util/api_util';

export const receiveAllPokemon = (pokemon) => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
});

export const receiveSinglePokemon = (pokemon) => ({
  type: RECEIVE_SINGLE_POKEMON,
  pokemon
});

export const requestAllPokemon = () => (dispatch) => {
  return getAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)));
};

export const requestSinglePokemon = (id) => dispatch => {
  return getOnePokemon(id)
    .then(poke => dispatch(receiveSinglePokemon(poke)));
};
