class ApiController < ApplicationController
  def health_check
    render json: { 'message': 'Ahoy! This API is still safe from zombies (yet...)' }, status: :ok
  end
end
