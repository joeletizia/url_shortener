class ShortenedUrl < ActiveRecord::Base
  before_create :generate_shortened_url

  private

  def generate_shortened_url
    self.shortened_url = ShortenedUrls::Generators::MD5Generator.generate(self.original_url)
  end
end
