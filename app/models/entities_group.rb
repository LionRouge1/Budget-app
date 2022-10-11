class EntitiesGroup < ApplicationRecord
  has_many :entities, dependent: :destroy
  has_many :groups, dependent: :destroy

  validates :group_id, presence: true, numericality: { only_integer: true,
                                                       greater_than_or_equal_to: 1 }
  validates :entity_id, presence: true, numericality: { only_integer: true,
                                                        greater_than_or_equal_to: 1 }
end
