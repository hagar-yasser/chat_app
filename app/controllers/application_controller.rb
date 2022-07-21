class ApplicationController < ActionController::API
  # protect_from_forgery with: :exception
rescue_from ActiveRecord::RecordNotFound , with: :not_found
rescue_from StandardError , with: :standard_error


  private

  def standard_error
    render json: {error: "Internal Error! Try Again!"}, status: 500
  end

  def not_found
    render json: {error: "Not Found!"}, status: 404
  end

end
