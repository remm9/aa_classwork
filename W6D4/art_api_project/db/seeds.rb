# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ArtworkShare.destroy_all
Artwork.destroy_all
User.destroy_all

user1 = User.create(username: 'John Doe')
user2 = User.create(username: 'Jane Doe')
user3 = User.create(username: 'John Jr.') 


art1 = Artwork.create(title: 'Mona Lisa', image_url: 'artwork.com/art1', artist_id: user1.id)
art2 = Artwork.create(title: 'Salvadore Dali painting', image_url: 'artwork.com/art2', artist_id: user2.id)
art3 = Artwork.create(title: 'Van Gough painting', image_url: 'artwork.com/art3', artist_id: user3.id)

art_share1 = ArtworkShare.create(artwork_id: art1.id, viewer_id: user3.id)
art_share2 = ArtworkShare.create(artwork_id: art2.id, viewer_id: user1.id)
art_share3 = ArtworkShare.create(artwork_id: art3.id, viewer_id: user2.id)
art_share4 = ArtworkShare.create(artwork_id: art1.id, viewer_id: user2.id)

# u1 has shared artwork 2 twice 
# u2 has shared artwork 1 once, and 3 twice 
# u3 has empty array 
