class AlertsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

  def index
    data = Alert.where(user: current_user)
                .page(params[:page])
                .per(params[:per_page])
    data = data.where(status: params[:status]) if params[:status].present?
    render json: data, status: 200
  end

  def create
    coin = Coin.find_by!(sym: params[:sym])
    render json: Alert.create!(user: current_user,
                                coin: coin,
                                status: 'created',
                                price: params[:price]), status: 200
  end

  def delete
    alert = Alert.find(params[:id])
    if alert.user != current_user
      render json: 'Unauthorized', status: :unauthorized
      return
    end
    alert.status = 'deleted'
    alert.save!
    render json: alert, status: 200
  end

  private

  def handle_record_not_found(e)
    render json: { errors: e.message }, status: :unprocessable_entity
  end
end
