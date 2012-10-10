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
      def determination(determ, handler, *args)
        determinations[determ] = {:handler => handler.new, :args => args}
      end
    end

    def initialize(uri, html_cache=nil)
      # Get page; lazily parsed
      @page = WebPage.new(uri, html_cache)
    end

    # Pass the webpage to the hander and have it get to work
    def determine(determ, *args)
      if determ.to_sym == :all
        data = {}
        
        self.class.determinations.keys.each do |key|
          data[key] = self.determine(key) rescue nil
        end

        return data
      end

      determiner = self.class.determinations[determ.to_sym]
      raise "Determination #{determ.to_sym} not found" if determiner.nil?

      args = determiner[:args].map{|arg| self.determine(arg) } + args

      return determiner[:handler].determine(@page, *args)
    end
  end
end