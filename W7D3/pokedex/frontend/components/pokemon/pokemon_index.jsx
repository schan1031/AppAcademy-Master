import React from 'react';

export default class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    return (
      <div>
        <ul>
          {
            this.props.pokemon.map((poke, idx) => (
              <li key={idx}>
                <p>{poke.name}</p>
                <img src={poke.image_url} height='75' width='75' ></img>
              </li>
            ))
          }
        </ul>
      </div>
    );
  }
}
