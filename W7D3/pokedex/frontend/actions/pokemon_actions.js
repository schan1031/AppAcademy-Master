export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';

import {getAllPokemon} from '../util/api_util';

export const receiveAllPokemon = (pokemon) => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
});

export const requestAllPokemon = () => (dispatch) => {
  return getAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)));
};
