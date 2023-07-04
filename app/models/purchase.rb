class Purchase < ApplicationRecord
  belongs_to :author
  has_and_belongs_to_many :categories

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0.01 }
end
