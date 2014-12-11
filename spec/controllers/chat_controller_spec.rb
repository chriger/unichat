require 'rails_helper'

describe 'ChatController' do
  context '#send_message' do
    it 'should pass message to message queue' do
      expect(create_event('chat.send_message', 'Foobar').dispatch).to trigger_message( { message: 'it works' } )
    end
  end

  context '#get_messages' do
    pending 'TODO get messages from queue'
  end
end
