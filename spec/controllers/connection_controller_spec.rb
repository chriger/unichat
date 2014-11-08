require 'rails_helper'

describe 'ConnectionController' do
  context '#pong' do
    it "should send a 'pong' message" do
      expect(create_event('connection.ping', 'foobar').dispatch).to trigger_message
    end
  end
end
