import React from 'react';
import {PokemonIndexItem } from './pokemon_index_item';
import { Route } from 'react-router-dom';
import PokemonDetailContainer from './pokemon_detail_container';

export default class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    const pokemonItems = this.props.pokemon.map(
      poke => <PokemonIndexItem key={poke.id} pokemon={poke} />
    );
    return (
      <div className='main-window'>
        <ul className='pokemon-list'>
          {pokemonItems}
        </ul>
        <Route path='/pokemon/:pokemonId' component={PokemonDetailContainer}/>

      </div>
    );
  }
}
