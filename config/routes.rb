Rails.application.routes.draw do
  get 'sessions/new'
  get 'static_pages/home'
  get 'static_pages/contact'

  # signup student 
  get 'signup' => 'students#new'

  # signin student 
  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'

  # signout 
  delete 'signout' => 'sessions#destroy'

  # destroy student 
  delete 'destroystu' => 'students#destroy'

  root 'static_pages#home'

  resources :students
end
