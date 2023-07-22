Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  resources :offers, only: [:index, :show, :new, :create, :edit, :update, :destroy], path: 'offers', as: 'offers',  controller: 'offer'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :job_applications, only: [:new, :create, :show]
  post '/offers', to: 'offer#create'
  # Defines the root path route ("/")
  root "home#index"
end
