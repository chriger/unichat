module AmqpQueue
  def self.create_by_id(id)
    AmqpConnection.channel.queue("chat.#{id}", auto_delete: false)
  end

  def self.destroy_by_id(id)
    AmqpConnection.channel.queue("chat.#{id}").delete
  end
end

