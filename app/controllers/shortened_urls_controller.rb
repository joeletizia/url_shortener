class ShortenedUrlsController < ApplicationController
  def index
    # I think explicit rendering rather than implicit is always nice. 
    render :index
  end

  def new
    render :new, locals: {shortened_url: ShortenedUrl.new}
  end

  def create
    # what I would really like here is some type of Maybe structure that I can pattern match on to check for success of the side effect of saving.
    # This is easy to do in languages like Elixir, Haskell, and Scala because pattern matching is a first class concept. I could return a tuple of { :ok, shortened_url }.
    # But since this is ruby, we can just see if the returned instance was saved to the DB.
    #
    # In the past, I've come up with validation structures to wrap IO calls that have a good chance of failing.
    # ActiveRecord does this with `update_attirbutes` returning true and false, but I don't particularly like that because I want the validation and the data to be separate.
    shortened_url = create_shortened_url_from_params(shortened_url_params)

    if shortened_url.persisted?
      render :show, locals: { shortened_url_presenter: ShortenedUrls::Presenter.new(shortened_url)}
    else
      render :new, status: :unprocessable_entity, locals: { shortened_url: shortened_url }
    end
  end

  private

  def shortened_url_params
    params.require(:shortened_url).permit(:original_url)
  end

  def create_shortened_url_from_params(shortened_url_params)
    ShortenedUrls::Builder.create(original_url: shortened_url_params[:original_url])
  end
end
