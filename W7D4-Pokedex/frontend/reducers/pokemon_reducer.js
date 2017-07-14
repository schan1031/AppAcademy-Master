import merge from 'lodash/merge';
import { RECEIVE_ALL_POKEMON, RECEIVE_SINGLE_POKEMON } from '../actions/pokemon_actions';

const defaultState = {
  entities: {},
  currentPoke: null
};

export const pokemonReducer = (state = defaultState, action) => {
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_ALL_POKEMON:
      const tmp = merge({}, state);
      return merge(tmp, {entities: action.pokemon});
    case RECEIVE_SINGLE_POKEMON:
      const poke = action.pokemon.poke;
      const single = merge({}, state);
      // console.log(action.pokemon);
      return merge(single, {
        entities: { [poke.id]: poke },
        currentPoke: poke.id
      });
    default:
      return state;
  }
};
