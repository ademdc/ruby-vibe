require 'spec_helper'

RSpec.describe RubyVibe::Client do
  let(:token) { '123456789' }
  let(:token2) { '987654321' }

  it 'sets passed auth token with precedence over configured one' do
    RubyVibe.configure { |config| config.auth_token = token }
    viber = RubyVibe.new(auth_token: token2)

    expect(viber.client.token).to be token2
  end

  it 'shows error message for wrong token' do
    viber = RubyVibe.new(auth_token: token)

    expect(viber.get_account_data.success?).to be false
  end

end