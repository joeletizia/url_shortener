require 'spec_helper'

describe ShortenedUrlsController do
  describe "#index" do
    it "renders the index template" do
      get :index
      expect(controller).to render_template("index")
    end
  end

  describe "#create" do
    let(:url_params) do
      {
        shortened_url:
          { original_url: "reddit.com/r/rails"}
      }
    end
    let(:shortened_url) { double(:shortened_url) }
    let(:presenter) { double(:presenter) }

    before do
      allow(ShortenedUrl).to receive(:new) { shortened_url }
      allow(shortened_url).to receive(:update_attributes).with(url_params[:shortened_url]) { shortened_url_success }
      allow(controller).to receive(:render)
    end

    context "when the shortened URL is created successfully" do
      let(:shortened_url_success) { true }

      before do
        allow(ShortenedUrls::Presenter).to receive(:new).with(shortened_url) { presenter }
      end

      it "renders the show template" do
        post :create, url_params
        expect(controller).to have_received(:render).with("show", locals: { shortened_url_presenter: presenter})
      end
    end

    context "when teh shortened url is not created successfully" do
      let(:shortened_url_success) { false }

      it "renders the form" do
        post :create, url_params
        expect(controller).to have_received(:render).with(partial: "form", status: :unprocessable_entity)
      end
    end
  end

  describe "#new" do
    it "renders the new template" do
      get :new
      expect(controller).to render_template("new")
    end
  end
end
