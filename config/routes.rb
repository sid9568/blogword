Rails.application.routes.draw do
    root "posts#index"
 
  get 'home/_header'
 
  get "posts/show"=>"posts#show"
  get "posts/new"=>"posts#new"
  get "posts/edit/:id"=>"posts#edit"
  get "/posts/edit", to: "posts#edit"
  post "posts/create"=>"posts#create"
  post "posts/update"=>"posts#update"
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
  get "comments/index"=>"comments#index" do
   


     resources :likes

   end
  # end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
