class Entity < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :groups

  def create_at
    date = Date.parse(create_at)
    date.strftime('%d %b %Y %I:%M %p')
  end

  validates :name, presence: true
  validates :amount, presence: true
end
