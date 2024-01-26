Rails.application.routes.draw do
  get '/health-check' => 'api#health_check'

  namespace :api do
    post '/user' => 'users#create'
    put '/user/:id/locate' => 'users#locate'
    get '/user/:id/inventory' => 'users#inventory'
    post '/user/:id/give' => 'users#give'
    post '/user/:id/take' => 'users#take'

    post '/infection_notification/user' => 'infection_notifications#notify'

    post '/users/trade' => 'users#trade'

    namespace :reports do
      get '/infected-users' => '/api/reports#infected_users'
      get '/healthy-users' => '/api/reports#healthy_users'
      get '/average-item-per-user' => '/api/reports#average_item_per_user'
      get '/points-lost-on-infection' => '/api/reports#points_lost_on_infection'
    end
  end
end
