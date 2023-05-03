class ApplicationController < ActionController::Base
  require 'uri'
  require 'net/http'
  require 'http' 


 
  
  url = URI("https://indeed12.p.rapidapi.com/jobs/search?query=manager&location=chicago&page_id=2&fromage=3")
  
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  
  request = Net::HTTP::Get.new(url)
  request["X-RapidAPI-Key"] = Rails.application.credentials.indeed_api_key
  request["X-RapidAPI-Host"] = 'indeed12.p.rapidapi.com'
  
  @response = http.request(request)






  def current_user
    auth_headers = request.headers["Authorization"]
    if auth_headers.present? && auth_headers[/(?<=\A(Bearer ))\S+\z/]
      token = auth_headers[/(?<=\A(Bearer ))\S+\z/]
      begin
        decoded_token = JWT.decode(
          token,
          Rails.application.credentials.fetch(:secret_key_base),
          true,
          { algorithm: "HS256" }
        )
        User.find_by(id: decoded_token[0]["user_id"])
      rescue JWT::ExpiredSignature
        nil
      end
    end
  end

  def authenticate_user
    unless current_user
      render json: {}, status: :unauthorized
    end
  end


  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
 
  def authenticate_user
    redirect_to '/login', status: :see_other unless current_user
  end

  
      


end
