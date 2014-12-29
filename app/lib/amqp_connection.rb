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
    @conn = Bunny.new(host: configuration['host'], vhost: configuration['vhost'], user: configuration['user'], password: configuration['password'], continuation_timeout: configuration['continuation_timeout']).tap do |connection|
      connection.start
      at_exit do
        connection.close
      end
    end
  end

  def self.configuration
    host = YAML.load_file(File.join(Rails.root,'config','amqp_host.yml'))
    host[Rails.env]
  end
end
