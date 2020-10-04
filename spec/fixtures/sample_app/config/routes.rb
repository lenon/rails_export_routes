# frozen_string_literal: true

Rails.application.routes.draw do
  resource :profile
  resources :products, only: %i[index show]

  namespace :admin do
    resources :brands
  end

  resources :comments do
    member do
      post 'upvote'
      post 'downvote'
    end

    collection do
      get 'recent'
    end
  end

  resources :posts, constraints: { id: /[0-9A-Za-z\-.]+/ }

  get '/photos/:id', to: 'photos#view'
  get '/photos/:id/comments', to: 'photos#comments', as: 'photo_comments'

  mount -> {} => '/rack/app'

  root to: 'welcome#index'
end
