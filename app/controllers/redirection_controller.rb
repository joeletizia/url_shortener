class RedirectionController < ApplicationController
  def show
    # In general, I don't like to use IVars in controllers. I generally like to set locals in my render declarations.
    if shortened_url.present?
      redirect_to shortened_url.original_url
    else
      flash[:error] = "The given shortened URL was not found."
      redirect_to root_path
    end
  end

  private

  def shortened_url
    ShortenedUrl.find_by_shortened_url(params[:id])
  end
end
