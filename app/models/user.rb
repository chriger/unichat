class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  after_create :create_message_queue

  after_destroy :destory_message_queue

  validate :name, :public_key, uniqueness: true


  private

  def create_message_queue
    AmqpQueue.create_by_id(id)

  end

  def destroy_message_queue
    AmqpQueue.destroy_by_id(id)
  end
end
