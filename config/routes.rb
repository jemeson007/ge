Rails.application.routes.draw do


  get 'cheeses/index'
  get 'cheeses/new'
  get 'cheeses/create'


  devise_for :people


  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :properties
  resources :cheeses, only: [:index, :new, :create]

  root 'welcome#index'
end
