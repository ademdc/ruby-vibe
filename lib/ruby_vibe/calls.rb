require 'ruby_vibe/calls/info'
require 'ruby_vibe/calls/messaging'

class RubyVibe
  module Calls 
    include Info
    include Messaging
  end
end