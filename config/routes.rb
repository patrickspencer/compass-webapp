CompassWebApp::Application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  devise_scope :user do
    get "/login", to: "devise/sessions#new"
    get "/logout", to: "devise/sessions#destroy"
  end

  root 'student/problems#index'

  get 'admin', to: 'admin/welcome#index', as: 'admin_welcome'
  namespace :admin do
    resources :assignments
    resources :users
    resources :problem_templates
  end

  get '/student', to: 'student/welcome#index', as: 'student_welcome'
  namespace :student do
    resources :assignments
    resources :problems
    resources :answers
  end

end
