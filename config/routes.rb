Linkding::Application.routes.draw do
  resources :bookmarks, except: :show do
    get :recent, on: :collection
  end
  resource :import, only: [:show, :create], controller: 'Import'

  devise_for :users

  match 'bookmarklet.js' => 'tools#bookmarklet'

  root to: 'home#index'
end
