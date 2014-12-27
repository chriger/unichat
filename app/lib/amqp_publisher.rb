module AmqpPublisher
  def self.publish_message(message)
    id = User.find_by_name(message[:to]).id
    x = AmqpConnection.channel.default_exchange
    x.publish(message[:payload], routing_key: "#{id}", headers: { from: message[:from] })
  end
end
