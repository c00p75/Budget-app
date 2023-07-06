require 'rails_helper'

RSpec.describe 'categories/index', type: :view do
  include Devise::Test::IntegrationHelpers
  before(:example) do
    @user = User.create(name: 'Ben', email: 'gmail@gmail.com', password: '123456')
    @category = Category.create(name: 'Pets', icon: 'someicon.png')
    @purchase = Purchase.create(name: 'Dog food', amount: 20, author: @user)
    @category.purchases << @purchase
    @categories = Category.all
    sign_in @user
    render
  end
  it 'should render a list of categories' do
    expect(rendered).to have_content 'Pets'
  end
  it 'should have link to new category' do
    expect(rendered).to have_link('Add Category', href: new_category_path)
  end
  it 'should click on category' do
    expect(rendered).to have_link('Pets', href: category_path(@category))
  end
end
