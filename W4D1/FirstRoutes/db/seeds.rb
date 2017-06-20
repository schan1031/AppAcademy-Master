# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

# User.create(name: 'Andy', email: 'andy@abc.com')
# User.create(name: 'Billy', email: 'billy@thekid.com')
# User.create(name: 'Molly', email: 'molly@holly.com')

User.create(username: 'Bob101')
User.create(username: 'Dragonslayer5000')
User.create(username: 'LeoDahVinci')
#


Artwork.create(title: 'Adam and Eve', image_url: 'adamandeve.org', artist_id: User.first.id)
Artwork.create(title: 'dragons', image_url: 'drag.ons', artist_id: User.second.id)

ArtworkShare.create(viewer_id: User.third.id, artwork_id: Artwork.first.id)
ArtworkShare.create(viewer_id: User.first.id, artwork_id: Artwork.first.id)
ArtworkShare.create(viewer_id: User.second.id, artwork_id: Artwork.second.id)
