import React from 'react';
import { Route } from 'react-router-dom';
// import ItemContainer from './item_container'

export default class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    const id = this.props.match.params.pokemonId;
    this.props.requestSinglePokemon(id);
  }

  componentWillReceiveProps(newProps) {
    if (this.props.match.params.pokemonId !== newProps.match.params.pokemonId) {
      this.props.requestSinglePokemon(newProps.match.params.pokemonId);
    }
  }


  render () {
    const poke = this.props.pokemon;
    const moves = poke.moves.moves.map(
      (move, idx) => <li key={idx}>Move {idx+1}: {move}</li>
    );

    return (
      <div className='pokemon-detail'>
        <img src={poke.image_url} width='400' height='400'></img>
        <h2>{poke.name}</h2>
        <ul>
          <li>Type: {poke.poke_type.poke_type}</li>
          <li>Attack: {poke.attack}</li>
          <li>Defense: {poke.defense}</li>
        </ul>
        <ul className='moves'>
          {moves}
        </ul>


      </div>
    );

  }
}

// <Route path='/pokemon/:pokemonId/items/:itemId' component={ItemContainer} />
