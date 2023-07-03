require 'rails_helper'

RSpec.describe "category_purchases/edit", type: :view do
  let(:category_purchase) {
    CategoryPurchase.create!(
      category: nil,
      purchase: nil
    )
  }

  before(:each) do
    assign(:category_purchase, category_purchase)
  end

  it "renders the edit category_purchase form" do
    render

    assert_select "form[action=?][method=?]", category_purchase_path(category_purchase), "post" do

      assert_select "input[name=?]", "category_purchase[category_id]"

      assert_select "input[name=?]", "category_purchase[purchase_id]"
    end
  end
end
