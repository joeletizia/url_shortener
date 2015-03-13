class ShortenedUrlsController < ApplicationController
  def index
  end

  def new
    @shortened_url = ShortenedUrl.new
  end

  def create
    @shortened_url = ShortenedUrl.new

    if @shortened_url.update_attributes(shortened_url_params)
      render "show", locals: { shortened_url_presenter: ShortenedUrls::Presenter.new(@shortened_url)}
    else
      render partial: "form", status: :unprocessable_entity
    end
  end

  private

  def shortened_url_params
    params.require(:shortened_url).permit(:original_url)
  end

end
