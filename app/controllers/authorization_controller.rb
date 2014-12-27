class AuthorizationController < WebsocketRails::BaseController

  def get_channel_key
    if user_signed_in?
      key = current_user.channel_key
      WebsocketRails[key].make_private
      send_message :key, key, :namespace => :user
    else
      send_message :key, nil, :namespace => :user
    end
  end

  def authorize_user_channel
    if user_signed_in? && current_user.channel_key == message[:channel]
      accept_channel nil
      listener = AmqpListener.new(current_user.id, current_user.channel_key)
      listener.subscribe
    else
      deny_channel nil
    end
  end
end
