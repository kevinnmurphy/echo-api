class PlaylistsController < ApplicationController

        def index 
          playlists = Playlist.all.order(id: :asc)
          render json: PlaylistSerializer.new(playlists).serialized_json
        end
      
        def show
          playlist = Playlist.find(params[:id])
          render json: PlaylistSerializer.new(playlist).serialized_json
        end
      
        def create
          playlist = Playlist.new(playlist_params)
          if playlist.save
            render json: PlaylistSerializer.new(playlist).serialized_json
          else
            render json: { error: 'Could not be created' }
          end
        end
      
        def update
          playlist = Playlist.find(params[:id])
          playlist.update(playlist_params)
          render json: PlaylistSerializer.new(playlist)
        end
      
        def destroy
          playlist = Playlist.find(params[:id])
          playlist.destroy
          render json: {message: "Successfully deleted #{playlist.name}"}
        end
      
        
        private
        
        def playlist_params
          params.require(:playlist).permit(:name, :description, :pic_url)
        end
      
end
