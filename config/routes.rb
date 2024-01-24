Rails.application.routes.draw do
  get '/health_check' => 'api#health_check'

  namespace :api do
    post '/user' => 'users#create'
    put '/user/:id/location' => 'users#update_location'
    post '/user/:id/give' => 'users#give'
    post '/user/:id/take' => 'users#take'
    post '/users/trade' => 'user#trade'
  end
end
