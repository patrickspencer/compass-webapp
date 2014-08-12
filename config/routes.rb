WebworkRails::Application.routes.draw do
  devise_for :users

  root 'welcome#index'

  match :dash, :to => 'dash/dashboard#index', :via => [:get]
  namespace :dash do
    resources :assignments
  end

end
