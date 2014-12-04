class ChatController < WebsocketRails::BaseController
  def send_message

    trigger_success({message: "It works"})
    new_message = { message: message }
    send_message :proceed_message, new_message, namespace: :chat
  end

  def get_messages
  end
end
