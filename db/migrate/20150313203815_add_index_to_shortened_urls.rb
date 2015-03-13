class AddIndexToShortenedUrls < ActiveRecord::Migration
  def change
    add_index :shortened_urls, :original_url
  end
end
