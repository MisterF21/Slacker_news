SlackerNews::Application.routes.draw do
  resources :articles, :except => [:edit]
  root :to => 'articles#index'
end
