require 'spec_helper'

describe ShortenedUrl do
  subject(:shortened_url) { ShortenedUrl.new }

  describe "validations" do
    it "original_urls are unique" do
      original_url = ShortenedUrl.create(original_url: "http://google.com")
      second_url = ShortenedUrl.new(original_url: "http://google.com")
      expect(second_url.valid?).to eq(false)
    end

    it "makes sure that original_urls are urls" do
      original_url = ShortenedUrl.new(original_url: "google.com")
      second_url = ShortenedUrl.new(original_url: "http://google.com")

      second_url.valid?
      original_url.valid?

      expect(second_url.errors[:original_url]).to eq([])
      expect(original_url.errors[:original_url]).to eq(["is invalid"])
    end
  end
end
