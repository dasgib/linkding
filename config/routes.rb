Linkding::Application.routes.draw do
  resources :bookmarks, except: :show
  resource :import, only: [:show, :create], controller: 'Import'

  devise_for :users

  root to: 'home#index'
end
