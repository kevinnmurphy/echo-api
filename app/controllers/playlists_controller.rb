class PlaylistsController < ApplicationController

        # def index 
        #   playlists = Playlist.all.order(id: :asc)
        #   render json: PlaylistSerializer.new(playlists, include: [:users]).serialized_json
        # end

        def index 
          playlists = Playlist.all.order(id: :asc)
          render json: PlaylistSerializer.new(playlists).serialized_json
        end
      
        def show
          playlist = Playlist.find_by_id(params[:id])
          render json: PlaylistSerializer.new(playlist).serialized_json
        end
      
        def create
          # @user = User.find(params[:user_id])
          playlist = Playlist.new(playlist_params)
          # playlist = @user.playlist.build(playlist_params)
          # playlist.user = @current_user
          if playlist.save
            # user.playlists << playlist
            render json: PlaylistSerializer.new(playlist).serialized_json
          else
            render json: { error: 'Could not be created' }
          end
        end
      
        def update
          playlist = Playlist.find(params[:id])
          # playlist = current_user.playlists.find(:id)
          if playlist.update(playlist_params)
          render json: PlaylistSerializer.new(playlist).serialized_json
          else
            render json: { error: 'Could not be updated' }
          end
        end
      
        def destroy
          if playlist.destroy
            render json: PlaylistSerializer.new(playlist).serialized_json
          else
            render json: { error: 'Could not be deleted' }
          end
        end
      
        
        private
        
        def playlist_params
          params.require(:playlist).permit(:name, :description, :pic_url, user_ids: []
          )
        end
      
end
