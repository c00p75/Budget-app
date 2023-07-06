require 'rails_helper'

RSpec.describe "purchases/new", type: :view do
  before(:example) do
    @user = User.create(name: 'Ben', email: 'gmail@gmail.com', password: '123456')
    @category = Category.create(name: 'Pets', icon: '')
    @categories = Category.all
    sign_in @user
    assign(:purchase, Purchase.new(name: "books", amount: 50))
    render
  end

  it 'should display the category form fields' do
    expect(rendered).to have_field('Name')
    expect(rendered).to have_field('Amount ($)')
  end

  it 'should display validation errors' do
    @purchase = Purchase.new
    @purchase.errors.add(:name, 'cannot be blank')
    assign(:purchase, @purchase) # Assign the category with errors to the view
    render # Render the view
    expect(rendered).to have_content('Name cannot be blank')
  end
end
