require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:example) do
    @user = User.create(name: 'Ben', email: 'gmail@gmail.com', password: '123456')
    @category = Category.create(name: 'Pets', icon: 'someicon.png')
    @purchase = Purchase.create(name: 'Dog food', amount: 20, author: @user)
    @category.purchases << @purchase
  end

  describe 'validations' do
    it 'should be valid' do
      expect(@category).to be_valid
    end
    it 'should not be valid' do
      @category.name = nil
      expect(@category).to_not be_valid
    end
    it 'should not be valid' do
      @category.icon = nil
      expect(@category).to_not be_valid
    end
  end

  describe 'attributes' do
    it 'should have correct name' do
      expect(@category.name).to eq('Pets')
    end
    it 'should have correct icon' do
      expect(@category.icon).to eq('someicon.png')
    end
  end

  describe 'associations' do
    it 'should belongs to user' do
      expect(@category.purchases.first).to eq(@purchase)
    end
  end
end
