WebworkRails::Application.routes.draw do
  devise_for :users

  root 'welcome#index'

  match :admin, :to => 'admin/dashboard#index', :via => [:get]
  namespace :admin do
    resources :assignments
  end

  get 'assignments/', to: 'assignments#show'
end
