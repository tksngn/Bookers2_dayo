Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'

  get 'users' => 'users#index'
  get 'homes/about' => 'homes#about'
  delete '/books' => 'books#destroy'

  resources :books
  resources :users,only:[:show,:edit,:update]

end
