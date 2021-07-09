require 'ruby_vibe/client'
require 'ruby_vibe/calls'
require 'ruby_vibe/version'
require 'ruby_vibe/configuration'
require 'ruby_vibe/urls'

class RubyVibe

  attr_accessor :client
  
  include Calls

  def initialize(auth_token: nil)
    @client = Client.new(auth_token: auth_token)
  end
end