require 'spec_helper'

describe ShortenedUrls::Presenter do
  subject(:presenter) { ShortenedUrls::Presenter.new(shortened_url) }
  let(:shortened_url) { double(:shortened_url) }

  describe "#formatted_shortened_url" do
    before do
      allow(shortened_url).to receive(:shortened_url) { "12345" }
    end

    it "appends the shortened url to the root path of the application url" do
      expect(presenter.formatted_shortened_url).to eq("http://localhost:3000/12345")
    end
  end
end
