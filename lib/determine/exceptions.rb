module Determine::Exceptions;end

Dir["#{__FILE__}/../exceptions/*.rb"].each { |f| require f }