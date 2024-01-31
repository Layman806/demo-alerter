class AlertsController < ApplicationController
  def index
    render json: Alert.where(user: current_user)
                      .page(params[:page])
                      .per(params[:per_page]), status: 200
  end
end
