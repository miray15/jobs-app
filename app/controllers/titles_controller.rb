class TitlesController < ApplicationController
  def index
  end

  def show 
    @title = Title.find_by(id: params[:id])
    render :show 
  end 

  def create
    @title = Title.create(
      company_name: params[:title][:company_name],

      job_description: params[:title][:job_description],

      date_applied: params[:title][:date_applied],

      followed_up: params[:title][:followed_up],

      interview: params[:title][:interview],

      remote: params[:title][:remote],

      salary: params[:title][:salary],
     
      updated_at: params[:title][:updated_at],
    )
    redirect_to "/titles"
  end

  def edit
    @title = Title.find_by(id: params[:id])
    render :edit
  end



end
