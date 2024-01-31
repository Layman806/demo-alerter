class PriceController < ApplicationController
  def new
    sym = params[:sym]
    new_price = params[:price]

    coin = Coin.find_by!(sym: sym)
    old_price = coin.price.to_d
    coin.price = new_price
    coin.save!

    logger.info "\nOld price: #{old_price}"
    logger.info "\nNew price recvd -- Sym: #{sym}, Price: #{new_price}"

    triggered_alerts(coin.id, old_price, new_price.to_d).each do |alert|
      logger.info "\nAlert Triggered, id: #{alert.id}, user_id: #{alert.user_id}, trigger_price: #{alert.price}"
    end
  end

  private

  def triggered_alerts(coin_id, old_price, new_price)
    alerts = []
    Alert.where(coin_id: coin_id).each do |alert|
      next if %w[deleted triggered].include? alert[:status]
      if (old_price >= alert[:price] and new_price <= alert[:price]) or (old_price <= alert[:price] and new_price >= alert[:price])
        alerts.append(alert)
        alert.status = 'triggered'
        alert.save!
      end
    end
    alerts
  end
end
