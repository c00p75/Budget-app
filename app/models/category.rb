class Category < ApplicationRecord
  has_and_belongs_to_many :purchases

  validates :name, presence: true, uniqueness: true

  before_create :titleize_name

  private

  def titleize_name
    self.name = name.titleize
  end
end
