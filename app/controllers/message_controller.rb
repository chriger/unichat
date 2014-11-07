class MessageController < WebsocketRails::BaseController
  def initialize_session
    # perform application setup here
    controller_store[:message_count] = 0
  end

  def send

  end

  def deliver
    send_message :deliver, { message: 'foobar' }
  end
end
