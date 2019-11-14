Rails.application.routes.draw do
  resources :guitars
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "blog_posts" => "blog_posts#index", as: "all_posts"
  get "blog_posts/new" => "blog_posts#new", as: "new_blog_post"
  get "blog_posts/:id" => "blog_posts#show", as: "blog_post"
  post "blog_posts" => "blog_posts#create"
  delete "blog_posts/:id" => "blog_posts#delete", as: "delete_blog_post"
  root to: 'blog_posts#index'
end
