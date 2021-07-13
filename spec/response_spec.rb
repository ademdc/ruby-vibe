require 'spec_helper'

RSpec.describe RubyVibe::Response do
  let(:success_response) { Struct.new(:body).new({"status": 0, "status_message": "ok", "message_token": 5595771666503728439, "chat_hostname": "SN-CHAT-16_"}.to_json) }
  let(:fail_response) { Struct.new(:body).new({"status": 1, "status_message": "Something went wrong", "message_token": 5595771666503728439, "chat_hostname": "SN-CHAT-16_"}.to_json) }
  
  it 'returns a Struct' do
    expect(RubyVibe::Response.parse(success_response)).to be_a Struct
  end

  it 'returns error message as nil when successful' do
    expect(RubyVibe::Response.parse(success_response).error_message).to be nil
  end

  it 'return false when status is 0' do
    expect(RubyVibe::Response.parse(fail_response).success?).to be false
  end

  it 'show error message when success? == false' do
    expect(RubyVibe::Response.parse(fail_response).error_message).not_to be nil
  end
end