class ChatController < WebsocketRails::BaseController
  def send_message

    trigger_success({message: "It works"})
    new_message = { message: message }
    send_message('chat.proceed_message', new_message)
  end

  def get_messages
  end
end
