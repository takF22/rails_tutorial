Rails.application.routes.draw do
  #devise_for :users
  #get 'blogs/index'
  #get 'blogs/new'
  #get 'blogs/create'
  #get 'blogs/show'
  #get 'blogs/edit'
  #get 'blogs/update'
  #get 'blogs/destroy'
  resources :blogs do 
    resources :comments
  end
  root 'blogs#index'
  get "blogs/show/:id", to: "blogs#show"
  post "blogs" => "blogs#create"
  devise_for :users, :controllers => {
          :sessions => 'users/sessions',
          :registrations => 'users/registrations',
          :passwords => "users/passwords"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
