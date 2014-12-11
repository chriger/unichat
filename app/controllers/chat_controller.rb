class ChatController < WebsocketRails::BaseController
  def send_message

    trigger_success( { message: 'it works' } )
  end

  def get_messages
  end
end
