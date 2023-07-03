require 'rails_helper'

RSpec.describe "category_purchases/show", type: :view do
  before(:each) do
    assign(:category_purchase, CategoryPurchase.create!(
      category: nil,
      purchase: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
