require 'spec_helper'

describe Relativize do
  it 'has a version number' do
    expect(Relativize::VERSION).not_to be nil
  end

  context 'given an absolute URL' do
    it 'returns only the path and the query' do
      url = 'https://example:80/path/more?query=1&param=true'

      expect(Relativize.new(url).call).to eq('/path/more?query=1&param=true')
    end

    it 'returns only the path if there is no query' do
      url = 'https://example:80/path/more/path'

      expect(Relativize.new(url).call).to eq('/path/more/path')
    end
  end

  context 'given a relative URL' do
    it 'returns the same path and query' do
      url = '/path/more?query=1&param=true'

      expect(Relativize.new(url).call).to eq('/path/more?query=1&param=true')
    end

    it 'returns the same path if there is no query' do
      url = '/path/more/path'

      expect(Relativize.new(url).call).to eq('/path/more/path')
    end
  end

  context 'given a URL without path or query' do
    it 'returns the relative URL after that port' do
      url = 'https://www.example.com'

      expect(Relativize.new(url).call).to eq('')
    end
  end

  context 'given a malformed URL' do
    it 'returns the provided default url' do
      expect(Relativize.new(nil, fallback_url: '/def').call).to eq('/def')
    end

    it "returns '/' if no default url is provided" do
      expect(Relativize.new(nil).call).to eq('/')
    end
  end
end
