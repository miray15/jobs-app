class SearchesController < ApplicationController

def index 
  @searches = Search.all 
  render :index 
end 

end
