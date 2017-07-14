import { values } from 'lodash';

export const selectAllPokemon = ({ pokemon }) => (
  values(pokemon.entities)
);

export const selectOnePokemon = ({pokemon}, id) => (
  values(pokemon.entities)[id]
);
