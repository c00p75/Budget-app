require 'rails_helper'

RSpec.describe "category_purchases/index", type: :view do
  before(:each) do
    assign(:category_purchases, [
      CategoryPurchase.create!(
        category: nil,
        purchase: nil
      ),
      CategoryPurchase.create!(
        category: nil,
        purchase: nil
      )
    ])
  end

  it "renders a list of category_purchases" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
