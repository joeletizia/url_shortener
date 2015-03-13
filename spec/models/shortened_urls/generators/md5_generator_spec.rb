require 'spec_helper'

describe ShortenedUrls::Generators::MD5Generator do
  describe ".generate" do
    let(:digestor) { double(:digestor) }
    before do
      allow(Digest::MD5).to receive(:new) { digestor }
      allow(digestor).to receive(:update)
      allow(digestor).to receive(:hexdigest) { "generated_string" }
    end

    it "returns the MD5 hash of the given url" do
      generator = ShortenedUrls::Generators::MD5Generator
      expect(generator.generate("joe")).to eq("generated_string"[0..5])
    end
  end
end
