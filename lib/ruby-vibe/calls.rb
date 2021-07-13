require 'ruby-vibe/calls/info'
require 'ruby-vibe/calls/messaging'

class RubyVibe
  module Calls 
    include Info
    include Messaging
  end
end