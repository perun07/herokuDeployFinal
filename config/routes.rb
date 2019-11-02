Rails.application.routes.draw do
  resources :searches
  devise_for :users 
  get "/pages/:page" => "pages#show"
  resources :pages
  resources :blog_posts
  root to: redirect('/blog_posts')

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
