module ShortenedUrls
  module Builder
    module_function

    def create(original_url:, generation_strategy: ShortenedUrls::Generators::MD5Generator)
      shortened_url = generation_strategy.generate(original_url)

      ShortenedUrl.create(original_url: original_url, shortened_url: shortened_url)
    end
  end
end
