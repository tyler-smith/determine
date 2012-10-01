module Determine::Exceptions;end
Dir[File.join(File.dirname(__FILE__), 'exceptions', '*.rb')].each { |f| require f }