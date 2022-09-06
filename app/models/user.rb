class User < ApplicationRecord
  has_many :entities, dependent: :destroy
  has_many :groups, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :fullname, presence: true

  def admin?
    role == 'admin'
  end
end
