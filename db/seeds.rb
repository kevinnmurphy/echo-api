# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#Specific seeds
user1 = User.create(name: 'Bob', email: "bob@gmail.com", pic_url: "https://unsplash.com/photos/dLij9K4ObYY" )
user2 = User.create(name: 'Janet', email: "janet123@gmail.com", pic_url: "https://unsplash.com/photos/HD8KlyWRYYM" )

playlist1 = Playlist.create(name: 'Electro', description: "Light me up!", pic_url: "https://images.unsplash.com/photo-1513829596324-4bb2800c5efb?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80" )
playlist2 = Playlist.create(name: 'Mood', description: "Rhythm and freestyle.", pic_url: "https://images.unsplash.com/photo-1514320291840-2e0a9bf2a9ae?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80" )
playlist3 = Playlist.create(name: 'Club', description: "When you're just feeling it.", pic_url: "https://images.unsplash.com/photo-1470225620780-dba8ba36b745?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80" )
playlist4 = Playlist.create(name: 'Classical', description: "Timeless music.", pic_url: "https://images.unsplash.com/photo-1507838153414-b4b713384a76?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80" )

UserPlaylist.create([
    {user_id: '1', playlist_id: '1'},
    {user_id: '1', playlist_id: '2'},
    {user_id: '1', playlist_id: '3'},
    {user_id: '2', playlist_id: '3'},
    {user_id: '2', playlist_id: '4'},
])

PlaylistSong.create([
    {playlist_id: '1', position:'0', spotify_id:'7ouMYWpwJ422jRcDASZB7P'},
    {playlist_id: '1', position:'1', spotify_id:'4VqPOruhp5EdPBeR92t6lQ'},
    {playlist_id: '1', position:'2', spotify_id:'2takcwOaAZWiXQijPHIx7B'},
])


#Random Seeds
unsplash_images = Unsplash::Photo.search('music', 1, 10)

unsplash_images.each do |img|
    Playlist.create(name: Faker::Music.album, description: Faker::Quote.robin , pic_url: img.urls.regular)
end

5.times do 
    User.create(name: Faker::Name.unique.name, email: Faker::Internet.email, pic_url: Faker::Avatar.image)
end

Playlist.all.each do |playlist|
    playlist.users = User.all.sample(3)
end
