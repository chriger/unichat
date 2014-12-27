class AmqpListener
  def initialize(id, channel_name)
    @queue = AmqpConnection.channel.queue("#{id}")
    @channel_name = channel_name
  end

  def subscribe
    @consumer = @queue.subscribe(block: true, manual_ack: true) do |delivery_info, properties, payload|
      binding.pry
      from = properties[:headers]["from"]
      to = User.find(delivery_info.routing_key).name
      puts "From: #{from}"
      puts "To: #{to}"
      puts "Message: #{payload}"

      WebsocketRails[@channel_name].trigger(:incoming_message, ChatMessage.new(from, to, payload).to_h)

      AmqpConnection.channel.acknowledge(delivery_info.delivery_tag, false)
    end
  end

  def unsubscribe
    @consumer.try(:cancel)
  end
end
