Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'welcome/index'
  
  resources :articles do
    resources :comments
  end
  resources :passwords
  root 'welcome#index'
end
