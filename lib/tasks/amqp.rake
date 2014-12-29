namespace :amqp do
  task :listen => :environment do |t|
    Rails.logger.info "Starting rake task #{t} at #{Time.now}"
      AmqpConnection.connection
    Rails.logger.info "Finished rake task #{t} at #{Time.now}"
  end
end
