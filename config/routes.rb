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
  get '/change_locale/:locale', to: 'settings#change_locale', as: :change_locale
end
