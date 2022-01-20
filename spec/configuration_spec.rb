# frozen_string_literal: true

require_relative './spec_helper'

RSpec.describe RubyVibe do
  let(:token) { '123456789' }
  let(:sender_name) { 'Sender' }
  let(:sender_avatar) { 'https://avatar.com/avatar.jpg' }

  it 'has auth token configured before initialisation' do
    RubyVibe::TOKEN = token
    bot = RubyVibe::Bot.new
    expect(bot.token).not_to be nil
  end

  it 'has sender_name configured before initialisation' do
    RubyVibe::NAME = sender_name
    bot = RubyVibe::Bot.new
    expect(bot.name).not_to be nil
  end

  it 'has avatar configured before initialisation' do
    RubyVibe::AVATAR = sender_avatar
    bot = RubyVibe::Bot.new
    expect(bot.avatar).not_to be nil
  end
end
