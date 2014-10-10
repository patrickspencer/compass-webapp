CompassWebApp::Application.routes.draw do
  devise_for :users

  root 'root#index'

  match :admin, :to => 'admin/dashboard#index', :via => [:get]
  namespace :admin do
    resources :assignments
  end

  scope module: 'student' do
    resources :assignments
  end
end
