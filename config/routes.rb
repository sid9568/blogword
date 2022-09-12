Rails.application.routes.draw do
  devise_for :users
    root "posts#index"
 
  get 'home/_header'
 
  get "posts/show"=>"posts#show"
  get "posts/new"=>"posts#new"
  get "posts/edit/:id"=>"posts#edit"
  get "/posts/edit/:id", to: "posts#edit",as: "posts_edit"
  post "posts/create"=>"posts#create"
  post "posts/update/:id"=>"posts#update",as: "posts_update"
  delete "posts/destroy" => "posts#destroy"
  get "posts/index"=>"posts#index" 

     
  
  #######comment##############
  get "comments/"=>"comments#show"
  get "comments/new/:id"=>"comments#new" ,as: "comment_new"
  get "comments/edit/:id"=>"comments#edit"
  get "/comments/edit", to: "comments#edit"
  post "comments/create/:id"=>"comments#create",as: "comment_create"
  post "comments/update"=>"comments#update"
  delete "comments/destroy" => "comments#destroy"
  get "comments/index"=>"comments#index" 
   


 post 'like/:id' => 'likes#create', as: "like_create"
 post 'like/:id' => 'likes#dislike', as: "dislike_create"
 
  resources :likes, only: [:create, :destroy]
end


   
  # end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

