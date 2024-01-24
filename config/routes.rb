Rails.application.routes.draw do
  get '/health_check' => 'api#health_check'

  namespace :api do
    post '/user' => 'users#create'
    put '/user/:id/location' => 'users#locate'
    post '/user/:id/give' => 'users#give'
    post '/user/:id/take' => 'users#take'

    post '/infection_notification/user' => 'infection_notifications#notify'

    post '/users/trade' => 'user#trade'

    namespace :reports do
      get '/infected_users', => 'reports#infected_users'
      get '/healthy_users', => 'reports#healthy_users'
      get '/average_item_per_user', => 'reports#average_item_per_user'
      get '/points_lost_on_infection', => 'reports#points_lost_on_infection'
    end
  end
end
