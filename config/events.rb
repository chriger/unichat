WebsocketRails::EventMap.describe do
  # You can use this file to map incoming events to controller actions.
  # One event can be mapped to any number of controller actions. The
  # actions will be executed in the order they were subscribed.
  #
  # Uncomment and edit the next line to handle the client connected event:
  #   subscribe :client_connected, :to => Controller, :with_method => :method_name
  #
  # Here is an example of mapping namespaced events:
  #   namespace :product do
  #     subscribe :new, :to => ProductController, :with_method => :new_product
  #   end
  # The above will handle an event triggered on the client like `product.new`.

  # Messages
  namespace :chat do
    subscribe :send_message, to: ChatController, with_method: :send_message
  end

  namespace :connection do
    subscribe :ping, to: ConnectionController, with_method: :pong
  end

  namespace :user do
    subscribe :get_channel_key, to: AuthorizationController, with_method: :get_channel_key
    subscribe :get_public_key, to: ChatController, with_method: :get_public_key
  end

  namespace :websocket_rails do
    subscribe :subscribe_private, to: AuthorizationController, with_method: :authorize_user_channel
  end
end
