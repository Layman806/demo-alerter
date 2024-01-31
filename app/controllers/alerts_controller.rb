class AlertsController < ApplicationController
  def index
    data = Alert.where(user: current_user)
                .page(params[:page])
                .per(params[:per_page])
    data = data.where(status: params[:status]) if params[:status].present?
    render json: data, status: 200
  end
end
