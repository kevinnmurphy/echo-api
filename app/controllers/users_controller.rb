class UsersController < ApplicationController

  def index 
    users = User.all.order(id: :asc)
    options = { include: [:playlists] }
    render json: UserSerializer.new(users, options).serialized_json
  end

  def show
    user = User.find(params[:id])
    options = { include: [:playlists] }
    render json: UserSerializer.new(users, options).serialized_json
  end

  def create
    user = User.new(user_params)
    if user.save
      options = { include: [:playlists] }
      render json: UserSerializer.new(user, options).serialized_json
    else
      render json: { error: 'Could not be created' }
    end
  end

  def update
    user = user = User.find(params[:id])
    user.update(user_params)
    options = { include: [:playlists] }
    render json: UserSerializer.new(user, options)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: {message: "Successfully deleted #{user.name}"}
  end

  
  private
  
  def user_params
    params.require(:user).permit(:uder_id, :name, :description,
    )
  end

end
