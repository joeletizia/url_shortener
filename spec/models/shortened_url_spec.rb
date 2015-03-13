require 'spec_helper'

describe ShortenedUrl do
  subject(:shortened_url) { ShortenedUrl.new }

  describe "callbacks" do
    it "assigns the shortened_url attribute before create" do
      shortened_url.original_url = "hello"
      shortened_url.save
      expect(shortened_url.shortened_url).not_to be_blank
    end
  end
end
