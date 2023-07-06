require 'rails_helper'

RSpec.describe 'categories/new', type: :view do
  before(:example) do
    @user = User.create(name: 'Ben', email: 'gmail@gmail.com', password: '123456')
    sign_in @user
    assign(:category, Category.new(name: 'Education', icon: 'icons/books.png'))
    render
  end

  it 'should display the category form fields' do
    expect(rendered).to have_field('Name')
    expect(rendered).to have_field('Icon link ( i.e https://...png )')
  end

  it 'should display validation errors' do
    @category = Category.new
    @category.errors.add(:name, 'cannot be blank')
    assign(:category, @category) # Assign the category with errors to the view
    render # Render the view
    expect(rendered).to have_content('Name cannot be blank')
  end
end
