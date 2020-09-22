Rails.application.routes.draw do
   # root 'users#index'

  resources :playlist_songs
  resources :user_playlists
  resources :playlists
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
