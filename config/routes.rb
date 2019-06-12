Rails.application.routes.draw do
  resources :idoponts
  resources :kezeles
  devise_for :users
  resources :users

  get 'users/index'
  get '/', :to => redirect('/index.html')

  # match 'lang/:locale', to: 'index#change_locale', as: :change_locale, via: [:get]
  scope "(:locale)", :locale => /en|hu/ do
    get '/idopontok', to: 'idoponts#index'
    get '/appointments', to: 'idoponts#index'
    get '/treatments', to: 'kezeles#index'
    get '/users', to: 'users#index'
    get '/felhasznalok', to: 'users#index'
    get '/home', to: 'users#home'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
