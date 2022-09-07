class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def total_amount
    entities.map { |entity| entity.amount }.sum
  end
end
