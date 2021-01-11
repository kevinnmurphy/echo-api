class PlaylistSongsController < ApplicationController

    def index 
        playlist_songs = PlaylistSong.all
        render json: PlaylistSongSerializer.new(playlist_songs).serialized_json
    end

    def create
        if  playlist = Playlist.find_by_id(params[:playlist_id])
          playlist_song = playlist.playlist_songs.build(playlist_songs_params)
        else
            playlist_song = PlaylistSong.new(playlist_params)
        end
        if playlist_song.save
          render json: PlaylistSongSerializer.new(playlist).serialized_json
        else
          render json: { error: 'Could not be created' }
        end
      end
    
      def update
        playlist_song = PlaylistSong.find(params[:id])

        if playlist_song.update(playlist_params)
          if playlist = Playlist.find_by_id(params[:playlist_id])
            playlist.playlist_songs << playlist_song
          end
        render json: PlaylistSongSerializer.new(playlist_song).serialized_json
        else
          render json: { error: 'Could not be updated' }
        end
      end
    
      def destroy
        playlist_song = PlaylistSong.find(params[:id])
        if playlist_song.destroy
          render json: PlaylistSongSerializer.new(playlist_song).serialized_json
        else
          render json: { error: 'Could not be deleted' }
        end
      end
    
      
      private
      
      def playlist_song_params
        params.require(:playlist_songs).permit(:position, :song_id, :playlist_id
        )
      end

end
