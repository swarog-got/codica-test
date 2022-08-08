# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  namespace :admins do
    resources :patients
    resources :doctors
    resources :categories
  end

  resources :users
  resources :categories
  resources :appointments
  resources :recommendations

  devise_scope :user do
    root to: "devise/sessions#new"
  end
end
