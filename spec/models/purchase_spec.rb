require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before(:example) do
    @user = User.create(name: 'Ben', email: 'gmail@gmail.com', password: '123456')
    @category = Category.create(name: 'Pets', icon: 'someicon.png')
    @purchase = Purchase.create(name: 'Dog food', amount: 20, author: @user)
    @category.purchases << @purchase
  end

  describe 'validations' do
    it 'should be valid' do
      expect(@purchase).to be_valid
    end
    it 'should not be valid' do
      @purchase.name = nil
      expect(@purchase).to_not be_valid
    end
    it 'should not be valid' do
      @purchase.name = 'a' * 51
      expect(@purchase).to_not be_valid
    end
    it 'should not be valid' do
      @purchase.amount = nil
      expect(@purchase).to_not be_valid
    end
  end

  describe 'attributes' do
    it 'should have correct name' do
      expect(@purchase.name).to eq('Dog food')
    end
    it 'should have correct amount' do
      expect(@purchase.amount).to eq(20)
    end
  end

  describe 'associations' do
    it 'should belongs to user' do
      expect(@purchase.categories.first).to eq(@category)
    end
  end
end
