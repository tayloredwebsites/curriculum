Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

scope "(:locale)", locale: /bs|hr|sr|en/ do

  get 'new_layout', to: 'translations#new_layout'
  resources :translations,
    only: [:index, :new, :create, :show, :edit, :update] do #, constraints: { :id => /[^\/]+/ }
    collection do
      get 'listing1', to: 'translations#index'
      get 'listing2', to: 'translations#listing2'
    end
  end

  get 'upload_summary', to: 'uploads#upload_summary'
  resources :uploads,
    only: [:index, :new, :create, :show, :edit, :update] do
    collection do
      get 'index2', to: 'translations#index2'
    end
    member do
      get 'start_upload'
      patch 'do_upload'
      post 'do_upload'
      get "do_upload" => "uploads#start_upload"
    end
  end

  resources :trees,
    only: [:index, :new, :create, :show, :edit, :update] do
    collection do
      get 'index_listing'
      post 'index_listing'
    end
  end


  resources :sectors, only: [:index] do
    collection do
      post 'index'
      get 'index'
    end
  end


  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/sign_out' => 'devise/sessions#destroy'
    get '/signout' => 'devise/sessions#destroy'
    get '/log_out' => 'devise/sessions#destroy'
    get '/logout' => 'devise/sessions#destroy'
  end
  get '/users/lang/:locale', to: 'users#lang', as: :lang_user
  resources :users,
    only: [:index, :new, :create, :show, :edit, :update ] do
    collection do
      get 'registrations'
      get 'index'
      get 'home'
    end
    member do
      get 'configuration'
    end
  end


  # root to: 'application#index'
  root to: 'users#home'
  get '/elm', to: 'application#index'

end # end routes scope

end # end route.draw
