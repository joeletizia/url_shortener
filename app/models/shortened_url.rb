class ShortenedUrl < ActiveRecord::Base
  # I'm not a fan of call backs. I don't like business logic to be tied to my persistence layer. 
  # Let's refactor this.
  validates_uniqueness_of :original_url
  validates_format_of :original_url, :with => URI::regexp(%w(http https))

  validates :shortened_url, presence: true
end
