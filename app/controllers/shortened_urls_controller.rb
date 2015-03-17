class ShortenedUrlsController < ApplicationController
  def index
  end

  def new
    @shortened_url = ShortenedUrl.new
  end

  def create
    @shortened_url = find_or_initialize_shortened_url(shortened_url_params)

    if @shortened_url.update_attributes(shortened_url_params)
      render "show", locals: { shortened_url_presenter: ShortenedUrls::Presenter.new(@shortened_url)}
    else
      render "new", status: :unprocessable_entity
    end
  end

  private

  def shortened_url_params
    params.require(:shortened_url).permit(:original_url)
  end

  def find_or_initialize_shortened_url(shortened_url_params)
    ShortenedUrl.where(shortened_url_params).first_or_initialize
  end

end
