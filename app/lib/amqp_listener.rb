class AmqpListener
  def initialize(name)
    @name = name
    @queue = AmqpConnection.channel.queue("chat.#{@name}")
  end

  def subscribe
    @consumer = @queue.subscribe(block: true, ack: true) do |delivery_info, properties, payload|
      JSON.load(payload)
    end
  end

  def unsubscribe
    @consumer.try(:cancel)
  end
end
