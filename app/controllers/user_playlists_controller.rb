class UserPlaylistsController < ApplicationController

    def index 
        user_playlists = UserPlaylist.all
        render json: UserPlaylistsSerializer.new(user_playlists).serialized_json
      end
    
      def show
        user_playlist = UserPlaylist.find(params[:id])
        render json: user_playlist
      end
    
      def create
        user_playlist = UserPlaylist.new(user_playlist_params)
        if user_playlist.save
          render json: UserPlaylistsSerializer.new(user_playlist).serialized_json
        else
          render json: { error: 'Could not be created' }
        end
      end
    
      def update
        user_playlist = user_playlist = UserPlaylist.find(params[:id])
        user_playlist.update(user_playlist_params)
        render json: UserPlaylistsSerializer.new(user_playlist)
      end
    
      def destroy
        user_playlist = UserPlaylist.find(params[:id])
        user_playlist.destroy
        render json: {message: "Successfully deleted #{user_playlist.name}"}
      end
    
      
      private
      
      def user_playlist_params
        params.require(:user_playlist).permit(:user_id, :playlist_id)
      end
      
end
