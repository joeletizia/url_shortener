class CreateShortenedUrlsTable < ActiveRecord::Migration
  def change
    create_table :shortened_urls do |t|
      t.timestamps
      t.text :original_url, null: false
      t.text :shortened_url, null: false
    end
  end
end
