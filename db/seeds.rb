# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(name: 'Bob', pic_url: "https://unsplash.com/photos/dLij9K4ObYY" )
user2 = User.create(name: 'Janet', pic_url: "https://unsplash.com/photos/HD8KlyWRYYM" )

playlist1 = Playlist.create(name: 'Electro', description: "Light me up!", pic_url: "https://unsplash.com/photos/JAHdPHMoaEA" )
playlist2 = Playlist.create(name: 'Mood', description: "Rhythm and freestyle.", pic_url: "https://unsplash.com/photos/gUK3lA3K7Yo" )
playlist3 = Playlist.create(name: 'Club', description: "When you're just feeling it.", pic_url: "https://unsplash.com/photos/YrtFlrLo2DQ" )
playlist4 = Playlist.create(name: 'Classical', description: "Timeless music.", pic_url: "https://unsplash.com/photos/rPOmLGwai2w" )

UserPlaylist.create([
    {user_id: '1', playlist_id: '1'},
    {user_id: '1', playlist_id: '2'},
    {user_id: '1', playlist_id: '3'},
    {user_id: '2', playlist_id: '3'},
    {user_id: '2', playlist_id: '4'},
])