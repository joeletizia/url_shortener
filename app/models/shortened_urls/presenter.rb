module ShortenedUrls
  class Presenter
    def initialize(shortened_url)
      @shortened_url = shortened_url
    end

    def formatted_shortened_url
      "http://#{HOST}:#{PORT}/#{shortened_url.shortened_url}"
    end

    private

    attr_reader :shortened_url
  end
end
