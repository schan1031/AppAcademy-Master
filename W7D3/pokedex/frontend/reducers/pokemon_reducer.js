import merge from 'lodash/merge';
import { RECEIVE_ALL_POKEMON } from '../actions/pokemon_actions';

export const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_ALL_POKEMON:
      const newState = {};
      const keys = Object.keys(action.pokemon);
      keys.forEach((el) => {
        let poke = action.pokemon[el];
        newState[poke.id] = poke;
      });
      return newState;
    default:
      return state;
  }
};
