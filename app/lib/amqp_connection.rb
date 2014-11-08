module AmqpConnection
  def self.connect
    conn = Bunny.new(host: configuration['host'], vhost: configuration['vhost'], user: configuration['user'], password: configuration['password'])
    conn.start
  end

  private

  def self.configuration
    host = YAML.load_file(File.join(Rails.root,'config','amqp_host.yml'))
    host[Rails.env]
  end
end
