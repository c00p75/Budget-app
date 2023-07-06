require 'rails_helper'

RSpec.describe "purchases/index", type: :view do
  before(:example) do
    @user = User.create(name: 'Ben', email: 'gmail@gmail.com', password: '123456')
    @category = Category.create(name: 'Pets', icon: '')
    @purchase = Purchase.create(name: 'Dog food', amount: 20, author: @user)
    @category.purchases << @purchase
    @categories = Category.all
    sign_in @user
    render
  end
  it 'should render a list of purchases' do
    expect(rendered).to have_content 'Dog food'
  end
  it 'should have link to new category' do
    expect(rendered).to have_link('Add New Transaction', href: link_to new_purchase_path)
  end