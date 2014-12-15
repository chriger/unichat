module AmqpConnection
  def self.connection
    connect unless @conn
    @conn
  end

  def self.channel
    if @channel.nil? || @channel.closed?
      @channel = @conn.create_channel
      @channel.prefetch(1)
    end

    @channel
  end

  private

  def self.connect
    @conn = Bunny.new(host: configuration['host'], vhost: configuration['vhost'], user: configuration['user'], password: configuration['password'])
    @conn.start
  end

  def self.configuration
    host = YAML.load_file(File.join(Rails.root,'config','amqp_host.yml'))
    host[Rails.env]
  end
end
