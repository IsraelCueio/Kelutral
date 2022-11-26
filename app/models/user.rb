class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_initialize :set_initial_experience, :if => :new_record?

  def set_initial_experience
    self.experience = 0
  end

  has_many :reports

end
