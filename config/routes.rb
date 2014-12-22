CompassWebApp::Application.routes.draw do
  devise_for :users

  root 'root#index'

  get 'admin', to: 'admin/welcome#index', as: 'admin_welcome'
  namespace :admin do
    resources :assignments
  end

  get '/student', to: 'student/welcome#index', as: 'student_welcome'
  namespace :student do
    resources :assignments
  end

  devise_scope :user do
    get "/login", to: "devise/sessions#new"
    get "/logout", to: "devise/sessions#destroy"
  end
end
