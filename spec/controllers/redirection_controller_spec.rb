require 'spec_helper'

describe RedirectionController do
  describe "#show" do
    before do
      allow(ShortenedUrl).to receive(:find_by_shortened_url).with("12345") { shortened_url }
    end

    context "when the given id is valid" do
      let(:shortened_url) { double(:shortened_url) }

      before do
        allow(shortened_url).to receive(:shortened_url) { "12345" }
        allow(shortened_url).to receive(:original_url) { "http://google.com" }
      end

      it "redirects to the corresponding url " do
        get :show, id: "12345"
        expect(controller).to redirect_to("http://google.com")
      end
    end

    context "when the given id is invalid" do
      let(:shortened_url) { nil }

      it "redirects to the root path" do
        get :show, id: "12345"
        expect(controller).to redirect_to(root_path)
      end

      it "sets a flash for the error" do
        get :show, id: "12345"
        expect(flash[:error]).to eq("The given shortened URL was not found.")
      end
    end
  end
end
