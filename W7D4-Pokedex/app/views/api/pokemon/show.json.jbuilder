json.poke do
  json.extract! @pokemon, :id, :name, :attack, :defense
  json.image_url asset_path(@pokemon.image_url)
  json.moves @pokemon, :moves
  json.poke_type @pokemon, :poke_type
end
json.items do
  json.extract! @pokemon.items
end
