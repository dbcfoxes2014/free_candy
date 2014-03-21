include SearchHelper
class HomeController < ApplicationController
  respond_to :json

  def index
    @user = current_user
  end

  def popular
    @media = grab_popular_media
    @message = "Popular Media"

    render :display
  end

  def search
    if params[:search_data] == ""
      flash[:alert] = "Enter something to search"
      redirect_to :root and return
    end

    @search_content = seperate_values(params[:search_data], ' ')
    @message = "Search Results for #{@search_content}"          
    
    if params[:commit] == "Search Images"
      @media = grab_select_media(@search_content, "image")  
    elsif params[:commit] == "Search Videos"
      @media = grab_select_media(@search_content, "video")
    else
      @media = grab_all_media(@search_content)  
    end    

    render :display
  end
end
