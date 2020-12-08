Rails.application.routes.draw do
  get 'personaldata/index'
  get 'test_task/index'
  get 'profilevisitor/index'
  devise_for :usernames
  get 'profile', to: 'profile#index'
  get 'profilevisitor', to: 'profilevisitor#index'
  get 'test_task', to: 'test_task#index'
  get 'personaldata', to: 'personaldata#index'
  get 'links', to: 'links#index'


  resources :taskforms do
    resources :issues
    resources :youanswers
    resources :accepts
  end
  devise_for :users
  resources :topics
  resources :visitors
  resources :statisticscreators
  resources :statisticvisitors
  resources :contacts
  resources :linktasks
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
