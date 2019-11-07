Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }  
  get 'welcome/index'
  
  resources :articles do
    resources :comments
    resources :likes
  end
  resources :passwords
  root 'welcome#index'
end
