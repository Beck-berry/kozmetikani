Rails.application.routes.draw do
  resources :idoponts
  resources :kezeles
  devise_for :users
  resources :users

  get 'users/index'

  resources :kezeles
  resources :idoponts

  # match 'lang/:locale', to: 'index#change_locale', as: :change_locale, via: [:get]

  get '/', :to => redirect('/index.html')
  get '/idopontok', to: 'idoponts#index'
  get '/appointments', to: 'idoponts#index'
  get '/treatments', to: 'kezeles#index'
  get '/users', to: 'users#index'
  get '/felhasznalok', to: 'users#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
