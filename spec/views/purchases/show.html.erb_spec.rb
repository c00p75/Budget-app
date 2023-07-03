require 'rails_helper'

RSpec.describe "purchases/show", type: :view do
  before(:each) do
    assign(:purchase, Purchase.create!(
      name: "Name",
      amount: 2,
      author: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
