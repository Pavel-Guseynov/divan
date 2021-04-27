# frozen_string_literal: true

Rails.application.routes.draw do
  root 'albums#index'

  resources :albums
  resources :images do
    get :file, on: :member
  end
end
