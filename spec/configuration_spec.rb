require 'spec_helper'

RSpec.describe RubyVibe::Configuration do
  let(:token) { '123456789' }
  let(:sender_name) { 'Sender' }
  let(:sender_avatar) { 'http://avatar.com/avatar.jpg' }

  it 'has auth token configured before initialisation' do
    RubyVibe.configure { |config| config.auth_token = token }
    expect(RubyVibe.config.auth_token).not_to be nil
  end

  it 'has sender_name configured before initialisation' do
    RubyVibe.configure { |config| config.sender_name = sender_name }
    expect(RubyVibe.config.sender_name).not_to be nil
  end

  it 'has auth token configured before initialisation' do
    RubyVibe.configure { |config| config.sender_avatar = sender_avatar }
    expect(RubyVibe.config.sender_avatar).not_to be nil
  end
end