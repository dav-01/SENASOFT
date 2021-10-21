Rails.application.routes.draw do

  resources :parking

  root to: 'parking#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
