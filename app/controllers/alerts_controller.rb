class AlertsController < ApplicationController
  def index
    render json: Alert.where(user: current_user), status: 200
  end
end
