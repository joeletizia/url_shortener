require 'spec_helper'

describe ShortenedUrlsController do
  before do 
      allow(controller).to receive(:render)
  end

  describe "#index" do
    it "renders the index template" do
      get :index
      expect(controller).to have_received(:render).with(:index)
    end
  end

  describe "#create" do
    let(:url_params) do
      {
        shortened_url:
          { original_url: "http://reddit.com/r/rails"}
      }
    end
    let(:presenter) { double(:presenter) }

    before do
      allow(ShortenedUrls::Presenter).to receive(:new).with(shortened_url) { presenter }
      allow(ShortenedUrls::Builder).to receive(:create).with(original_url: url_params[:shortened_url][:original_url]) { shortened_url }
    end

    context 'when the url is created successfully' do
      let(:shortened_url) { double(:shortened_url, persisted?: true) }

      it 'renders the show template' do
        post :create, url_params
        expect(controller).to have_received(:render).with(:show, locals: { shortened_url_presenter: presenter })
      end
    end

    context 'when the url fails to be created' do
      let(:shortened_url) { double(:shortened_url, persisted?: false) }

      it 'renders the new template and sends a 422' do
        post :create, url_params
        expect(controller).to have_received(:render).with(:new, { status: :unprocessable_entity, locals: { shortened_url: shortened_url }})
      end
    end
  end

  describe "#new" do
    let(:shortened_url) { double(:shortened_url) }

    before do
      allow(ShortenedUrl).to receive(:new) { shortened_url }
    end

    it "renders the new template" do
      get :new
      expect(controller).to have_received(:render).with(:new, locals: { shortened_url: shortened_url })
    end
  end
end
