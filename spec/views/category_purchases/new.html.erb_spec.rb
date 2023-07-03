require 'rails_helper'

RSpec.describe "category_purchases/new", type: :view do
  before(:each) do
    assign(:category_purchase, CategoryPurchase.new(
      category: nil,
      purchase: nil
    ))
  end

  it "renders new category_purchase form" do
    render

    assert_select "form[action=?][method=?]", category_purchases_path, "post" do

      assert_select "input[name=?]", "category_purchase[category_id]"

      assert_select "input[name=?]", "category_purchase[purchase_id]"
    end
  end
end
