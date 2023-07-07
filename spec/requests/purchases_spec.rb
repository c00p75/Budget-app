require 'rails_helper'

RSpec.describe PurchasesController, type: :request do
  include Devise::Test::IntegrationHelpers
  before(:example) do
    @user = User.create(name: 'Ben', email: 'gmail@gmail.com', password: '123456')
    @category = Category.create(name: 'Healthcare', icon: 'someicon.png')
    @purchase = Purchase.create(name: 'Monthly checkup', amount: 400, author: @user)
    @category.purchases << @purchase
  end

  describe 'GET /index' do
    before do
      sign_in @user
      get purchases_path
    end
    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end
    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
    it 'contains the correct content' do
      expect(response.body).to include 'Monthly checkup'
    end
  end

  describe 'GET /new' do
    before do
      sign_in @user
      get new_purchase_path
    end
    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end
    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
    it 'contains the correct content' do
      expect(response.body).to include 'New Transaction'
    end
  end
  describe 'POST /create' do
    before do
      sign_in @user
      post purchases_path,
           params: { purchase: { name: 'Flu medicine', amount: 5, author: @user, category_id: @category.id } }
    end

    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:found)
    end
    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
    it 'contains the correct content' do
      get purchases_path
      expect(response.body).to include 'Flu medicine'
    end
    it 'contains the correct content' do
      get categories_path(@category)
      expect(response.body).to include '405'
    end
  end
end
