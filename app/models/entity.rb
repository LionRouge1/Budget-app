class Entity < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :groups

  def create_at
    self.created_at.strftime('%d %b %Y %I:%M %p')
  end

  validates :name, presence: true
  validates :amount, presence: true
end
