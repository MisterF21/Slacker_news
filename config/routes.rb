SlackerNews::Application.routes.draw do
  resources :articles do
    resources :comments
  end
  resources :comments

  root :to => 'articles#index'

end
