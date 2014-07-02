Students::Application.routes.draw do
  resources :students do
    resources :courses
  end
  
  resources :contacts
  
  root 'pages#index'
  
  get ':action' => 'pages'
  
  devise_for :users, :controllers => {registrations: 'registrations'}
end
