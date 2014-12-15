class ChatController < WebsocketRails::BaseController
  before_filter :authenticate_user!
  def send_message
    if AmqpPublisher.publish_message(message)
      trigger_success( { message: 'message send' } )
    else
      trigger_failure( { message: 'failed to send message'})
    end
  end

  def get_messages
  end
end
