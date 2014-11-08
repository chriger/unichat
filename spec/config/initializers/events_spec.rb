require 'rails_helper'

describe 'Event mapping for this app' do

  context 'namespace message' do
    let(:send) { create_event('message.send', 'Foobar') }
    it 'subscribe send' do
      expect(send).to be_routed_only_to 'message#send'
    end
  end

  context 'namespace connection' do
    let(:ping) { create_event('connection.ping', nil) }

    it 'should send ping and route to connection#pong' do
      expect(ping).to be_routed_only_to 'connection#pong'
    end
  end
end
