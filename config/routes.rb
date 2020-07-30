Rails.application.routes.draw do
  get 'test_task/index'
  get 'profilevisitor/index'
  devise_for :usernames
  get 'profile', to: 'profile#index'
  get 'profilevisitor', to: 'profilevisitor#index'
  get 'test_task', to: 'test_task#index'
  devise_for :users
  resources :topics
  resources :visitors
  resources :statisticscreators
  resources :contacts
  resources :topics do
    resources :questions
    resources :answers
    resources :consents
    resources :passwords
    resources :usertabls
    resources :settings
end
  resources :creators
  get 'welcome/index'

  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
