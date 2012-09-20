module Determine
  class Determination
    # Accessor for getting our ordered list of handlers
    def handlers
      @handlers ||= []
    end

    # Takes the text and tries each handler on it until we get a determination
    # TODO: in future extend this to allow multiple determinations
    def determine(page)
      raise "No provided methods" if handlers.nil? || handlers.empty?

      handlers.each do |handler|
        result = self.send(handler, page)
        return result if result
      end

      nil
    end
  end
end