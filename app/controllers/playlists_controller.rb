class PlaylistsController < ApplicationController

        def index 
          playlists = Playlist.all.order(id: :asc)
          options = { include: [:users] }
          render json: PlaylistSerializer.new(playlists, options).serialized_json
        end
      
        def show
          playlist = Playlist.find_by_id(params[:id])
          options = { include: [:users] }
          render json: PlaylistSerializer.new(playlist, options).serialized_json
        end
      
        def create
          if  user = User.find_by_id(params[:user_ids])
            playlist = user.playlist.build(playlist_params)
          else
            playlist = Playlist.new(playlist_params)
          end
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
          #send multiple
          # if params[:user_ids].each do |uid| 
          
          if playlist.update(playlist_params)
            if user = User.find_by_id(params[:user_ids])
              user.playlists << playlist
            end
          render json: PlaylistSerializer.new(playlist).serialized_json
          else
            render json: { error: 'Could not be updated' }
          end
        end

        def remove_playlist
          user = User.find(id)
          playlist = Playlist.find(params[:id])
          user.playlists.remove(playlist)
        end
      
        def destroy
          playlist = Playlist.find(params[:id])
          if playlist.destroy
            render json: PlaylistSerializer.new(playlist).serialized_json
          else
            render json: { error: 'Could not be deleted' }
          end
        end
      
        
        private
        
        def playlist_params
          params.require(:playlist).permit(:name, :description, :pic_url, :user_ids
          )
        end
      
end
