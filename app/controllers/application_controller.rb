class ApplicationController < ActionController::API

  def json_success(body)
    render json: body, status: :ok
  end
end
