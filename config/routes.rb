Linkding::Application.routes.draw do
  resources :bookmarks, except: :show

  devise_for :users

  root to: 'home#index'
end
