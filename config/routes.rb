CompassWebApp::Application.routes.draw do
  namespace :student do
    resources :problems
  end
  devise_for :users, controllers: {registrations: 'users/registrations'}

  root 'student/problems#index'

  get 'admin', to: 'admin/welcome#index', as: 'admin_welcome'
  namespace :admin do
    resources :assignments
    resources :users
  end

  get '/student', to: 'student/welcome#index', as: 'student_welcome'
  namespace :student do
    resources :assignments
    resources :problems
  end

  devise_scope :user do
    get "/login", to: "devise/sessions#new"
    get "/logout", to: "devise/sessions#destroy"
  end
end
