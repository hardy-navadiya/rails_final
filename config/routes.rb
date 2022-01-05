Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/contact'

  # signup student 
  get 'signup' => 'students#new'

  root 'static_pages#home'

  resources :students
end
