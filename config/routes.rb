Rails.application.routes.draw do
  get 'attendances/index'
  get 'attendances/show'
  get 'attendances/new'
  get 'attendances/create'
  get 'attendances/edit'
  get 'attendances/update'
  get 'attendances/destroy'
  get 'grades/index'
  get 'grades/show'
  get 'grades/new'
  get 'grades/create'
  get 'grades/edit'
  get 'grades/update'
  get 'grades/destroy'
  get 'enrollments/index'
  get 'enrollments/show'
  get 'enrollments/new'
  get 'enrollments/create'
  get 'enrollments/edit'
  get 'enrollments/update'
  get 'enrollments/destroy'
  get 'courses/index'
  get 'courses/show'
  get 'courses/new'
  get 'courses/update'
  get 'courses/destroy'
  resources :students
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
