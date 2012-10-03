module Determine
  class WebPage
    attr_accessor :uri
    
    def initialize(uri)
      # Parse the uri ensuring it has a protocol specified
      @uri = URI(uri)
      @uri = URI("http://#{uri}") if @uri.scheme.nil?
    end
    
    # Alias for uri.host
    def domain
      @domain ||= uri.host
    end
    
    # Get the html parsed with nokogiri
    def source
      @source ||= Nokogiri::HTML(raw_source, nil, 'UTF-8')
    end

    def raw_source
      # Force the string to only use correct UTF-8 characters
      @raw_source ||= begin
        Iconv.new('UTF-8//IGNORE', 'UTF-8').iconv(@uri.read + ' ')[0..-2]
      end
    end
  end
end