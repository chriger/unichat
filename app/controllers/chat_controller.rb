class ChatController < WebsocketRails::BaseController
  def send_message
    trigger_success({message: "It works"})
  end

  def get_messages
  end
end
