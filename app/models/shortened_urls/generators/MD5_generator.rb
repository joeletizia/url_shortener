require 'digest'

module ShortenedUrls
  module Generators
    class MD5Generator
      def self.generate(original_url)
        md5 = Digest::MD5.new
        md5.update(original_url)
        md5.hexdigest[0..5]
      end
    end
  end
end
