# frozen_string_literal: true

require_relative 'ruby-vibe/url'
require_relative 'ruby-vibe/bot'
require_relative 'ruby-vibe/shortcuts'
require_relative 'ruby-vibe/version'

##
# RubyVibe represent a main module for Viber Bot.
# Multiple classes are used as shortcut classes,
# calling methods from RubyVibe::Bot class.
# Actual request to viber api is done by RubyVibe::Client class.
# Urls for viber API are defined in URL module.
#
# @see RubyVibe::Bot
# @see RubyVibe::Client
# @see URL
# @see [File] lib/ruby-vibe/shortcuts.rb
#

module RubyVibe
  # viber api auth_token to be used if not given by user
  TOKEN  = ''

  # sender name to be used if not given by user
  NAME   = ''

  # avatar url to be used if not given by user (require https)
  AVATAR = ''
end
