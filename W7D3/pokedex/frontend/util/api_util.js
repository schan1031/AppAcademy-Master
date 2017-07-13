export const getAllPokemon = () => (
  $.ajax({ method: 'GET', url: '/api/pokemon' })
);
