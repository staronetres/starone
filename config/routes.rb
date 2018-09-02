Rails.application.routes.draw do
  resources :categories
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'pages#index'
  get 'shop' => 'pages#shop'
  get 'about' => 'pages#about'
  get 'sale' => 'pages#sale'

  resources :categories
  resources :carts
  resources :product_items
  resources :orders

  resources :contacts, only: [:new, :create]
end
