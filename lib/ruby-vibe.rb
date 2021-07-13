require 'ruby-vibe/client'
require 'ruby-vibe/calls'
require 'ruby-vibe/version'
require 'ruby-vibe/configuration'
require 'ruby-vibe/urls'

class RubyVibe

  attr_accessor :client
  
  include Calls

  def initialize(auth_token: nil)
    @client = Client.new(auth_token: auth_token)
  end
end