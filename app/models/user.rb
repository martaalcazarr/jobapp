class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :job_applications
  has_many :offers, foreign_key: :admin_id
  has_one_attached :image
  def self.esteban
    find_by(admin: true)
  end
end
