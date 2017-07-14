export const getAllPokemon = () => (
  $.ajax({ method: 'GET', url: '/api/pokemon' })
);

export const getOnePokemon = (id) => (
  $.ajax({ method: 'GET', url: `/api/pokemon/${id}`})
);
