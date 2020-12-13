class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy

  has_many :boards, dependent: :destroy
  has_many :tasks, dependent: :destroy

  delegate :birthday, :age, :gender, to: :profile, allow_nil: true

  def has_written?(board)
    boards.exists?(id: board.id)    
  end

  def has_written_t?(task)
    tasks.exists?(id: task.id)    
  end

  def display_name
    profile&.nickname || self.email.split('@').first
  end

  # def birthday
  #   profile&.birthday
  # end

  # def gender
  #   profile&.gender
  # end


  def prepare_profile
    profile || build_profile
  end
end
