# frozen_string_literal: true

require_relative './spec_helper'

RSpec.describe RubyVibe::Client do
  let(:token) { '123456789' }
  let(:token2) { '987654321' }

  it 'sets passed auth token with precedence over configured one' do
    RubyVibe::TOKEN = token
    viber = RubyVibe::Bot.new(token: token2)

    expect(viber.token).to be token2
  end

  it 'shows error message for wrong token' do
    viber = RubyVibe::Bot.new(token: token)

    expect(viber.get_account_info.success?).to be false
  end

  it 'expects hash to exist in reponse' do
    viber = RubyVibe::Bot.new(token: token)
    expect(viber.get_account_info.data).to be_a Hash
  end
end
