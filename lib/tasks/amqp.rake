namespace :amqp do
  task :listen => :enviroment do |t|
    Rails.logger.info "Starting rake task #{t} at #{Time.now}"
      Amqp.connection
    Rails.logger.info "Finished rake task #{t} at #{Time.now}"
  end
end
