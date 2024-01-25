class ApiController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
  rescue_from StandardError, with: :generic_api_exception

  def health_check
    render json: { 'message': 'Ahoy! This API is still safe from zombies (yet...)' }, status: :ok
  end

  private

  def generic_api_exception(e, status = :unprocessable_entity)
    render json: { error: e.class, message: e.message }, status: status
  end

  def record_not_found(e)
    generic_api_exception(e, :not_found)
  end
end
