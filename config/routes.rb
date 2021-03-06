Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
namespace :api do
  namespace :v1 do
  resources :posts
  resources :users
    end
  end
  post '/signin', to: 'api/v1/auth#create'
  get '/welcome', to: 'api/v1/application#welcome'
  post '/likes', to: 'api/v1/posts#likes'
end
