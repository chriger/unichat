class ChatController < WebsocketRails::BaseController
  def send_message

    trigger_success({message: message})
  end

  def get_messages
  end
end
