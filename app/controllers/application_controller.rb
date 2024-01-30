class ApplicationController < ActionController::API

  SECRET_KEY = 'appsecretpass1234'

  def encode_token(payload)
    JWT.encode(payload, SECRET_KEY)
  end

  def decoded_token
    header = request.headers['Authorization']
    if header
      token = header.split(" ")[1]
      begin
        JWT.decode(token, SECRET_KEY)
      rescue JWT::DecodeError
        nil
      end
    end
  end
end
