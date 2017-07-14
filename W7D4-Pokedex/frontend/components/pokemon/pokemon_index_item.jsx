import React from 'react';
import { Link } from 'react-router-dom';

export const PokemonIndexItem = ( { pokemon }) => (
  <li className='pokemon-index-item'>
    <Link to={`/pokemon/${pokemon.id}`}>
      <span>{pokemon.id}</span>
      <img src={pokemon.image_url} height='75' width='75' ></img>
      <span>{pokemon.name}</span>
    </Link>
  </li>
);
