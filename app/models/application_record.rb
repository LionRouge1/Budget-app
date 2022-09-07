class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def total_amount
    entities.map(&:amount).sum
  end
end
