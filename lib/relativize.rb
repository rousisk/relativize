require "relativize/version"

class Relativize
  def initialize(url, fallback_url: '/')
    @url = url
    @fallback_url = fallback_url
  end

  def call
    make_relative(@url)
  end

  private

  def make_relative(url)
    uri = URI.parse(url)

    uri.query ? "#{uri.path}?#{uri.query}" : uri.path
  rescue URI::Error
    @fallback_url
  end
end
