class Purchase < ApplicationRecord
  belongs_to :author

  validates: :name, presence :true, length: { maximum:100 }
  validates: :amount, presence: true, numericality: { greater_than_or_equal_to: 0.01 }
end
