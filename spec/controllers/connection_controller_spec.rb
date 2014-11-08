require 'rails_helper'

describe 'ConnectionController' do
  context '#pong' do
    it "should send a 'pong' message" do
      expect(create_event('connection.ping', 'ping').dispatch).to trigger_message 'pong'
    end
  end
end
