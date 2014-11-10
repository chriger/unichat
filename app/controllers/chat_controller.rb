class ChatController < WebsocketRails::BaseController
  def send_message
    trigger_success 'succeed'
  end

  def get_messages
  end
end
