
require 'uri'
require 'net/http'

class SearchesController < ApplicationController



def index 
  url = URI("https://jsearch.p.rapidapi.com/search?query=#{params[:search]}&page=1&num_pages=1")
  
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  
  request = Net::HTTP::Get.new(url)
  request["X-RapidAPI-Key"] = 'Rails.application.credentials.jobs_api_key'
  request["X-RapidAPI-Host"] = 'jsearch.p.rapidapi.com'
  
  response = http.request(request)
  render :index

    @searches = Search.all
    
    if params[:search_by_title] && params[:search_by_title] != ""
      @searches = @searches.where("title like ?", 
      "%# {params[:search_by_title]}%")
    end
    if params[:search_by_location] && params[:search_by_location] != ""
      @searches = @searches.where("location like ?", 
      "%# {params[:search_by_location]}%")
    end
   if params[:search_by_salary] && params[:search_by_salary] != ""
      @searches = @searches.where("salary like ?", 
      "%# {params[:search_by_salary]}%")
    end
end 
  

end

