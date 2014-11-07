require 'rails_helper'

describe 'Event mapping for this app' do
  describe 'messages.send' do
    it 'should be routed correctly' do
      expect(create_event('messages.send', 'Foobar')).to be_routed_only_to 'message#send'
    end
  end
end
