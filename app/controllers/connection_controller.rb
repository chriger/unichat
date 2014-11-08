class ConnectionController < WebsocketRails::BaseController

  def pong
    trigger_success 'pong'
  end
end
