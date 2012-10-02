module Determine
  class Determiner
    class << self
      # A list of the possible determinations we can make
      def determinations
        @determinations ||= {}
      end

      # DSL-esque call for adding determinations
      # determ is the name e.g. :business_name
      # handler is a Determination subclass that does the work
      def determination(determ, handler)
        determinations[determ] = handler.new
      end
    end

    def initialize(uri)
      # Get page; lazily parsed
      @page = WebPage.new(uri)
    end

    # Pass the webpage to the hander and have it get to work
    def determine(determ)
      if determ.to_sym == :all
        data = {}
        
        self.class.determinations.keys.each do |key|
          data[key] = self.determine(key) rescue nil
        end

        return data
      end

      begin
        self.class.determinations[determ.to_sym].determine(@page)
      rescue NoMethodError
        raise "Determination #{determ.to_sym} not found"
      end
    end
  end
end