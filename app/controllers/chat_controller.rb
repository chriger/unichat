class ChatController < WebsocketRails::BaseController
  def send_message

    trigger_success({message: "It works"})
    send_message 'chat.proceed_message', {message: message}
  end

  def get_messages
  end
end
