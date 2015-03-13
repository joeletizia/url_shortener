class RedirectionController < ApplicationController
  def show
    @shortened_url = ShortenedUrl.find_by_shortened_url(params[:id])

    if @shortened_url
      redirect_to @shortened_url.original_url
    else
      flash[:error] = "The given shortened URL was not found."
      redirect_to root_path
    end
  end
end
