require 'rails_helper'

describe 'MessageController' do
  context '#send' do
    let(:send) { create_event('message.send', 'Foobar').dispatch }

    it 'should pass message to message queue' do
      pending 'TODO direct messages to queue'
    end
  end
end
