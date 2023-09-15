Rails.application.routes.draw do
    devise_for :users
    resources :users,only:[:show, :edit, :update, :new]
    resources :books
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root to: 'home#top'

    get 'users' => 'users#index'
    get '/home/about', to: 'home#about', as: 'about'

end
