Rails.application.routes.draw do
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
                  # ArticlesController#index
  get '/articles', to: 'articles#index', as: :articles #articles_path 

  get '/articles/new', to: 'articles#new', as: :new_article #new_article_path
  post '/articles', to: 'articles#create'

  get '/articles/:id', to: 'articles#show', as: :article   #article_path(1) => '/articles/1'

  get '/articles/:id/edit', to: 'articles#edit', as: :edit_article #edit_article_path(1) => '/articles/1/edit'
  patch '/articles/:id', to: 'articles#update'

  delete '/articles/:id', to: 'articles#destroy', as: :delete_article #delete_article_path
end