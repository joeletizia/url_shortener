class ShortenedUrl < ActiveRecord::Base
  before_create :generate_shortened_url

  validates_uniqueness_of :original_url
  validates_format_of :original_url, :with => URI::regexp(%w(http https))

  private

  def generate_shortened_url
    self.shortened_url = ShortenedUrls::Generators::MD5Generator.generate(self.original_url)
  end
end
