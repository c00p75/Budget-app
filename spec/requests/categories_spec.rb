require 'rails_helper'

RSpec.describe CategoriesController, type: :request do
  include Devise::Test::IntegrationHelpers
  before(:example) do
    @user = User.create(name: 'Ben', email: 'gmail@gmail.com', password: '123456')
    @category = Category.create(name: 'Pets', icon: '')
    @purchase = Purchase.create(name: 'Dog food', amount: 20, author: @user)
    @category.purchases << @purchase
  end

  describe 'GET /index' do
    before do
      sign_in @user
      get categories_path
    end
    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end
    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
    it 'contains the correct content' do
      expect(response.body).to include 'Pets'
    end
  end

  describe 'GET /show' do
    before do
      sign_in @user
      get category_path(@category)
    end
    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end
    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
    it 'contains the correct content' do
      expect(response.body).to include 'Dog food'
    end
  end

  describe 'GET /new' do
    before do
      sign_in @user
      get new_category_path
    end
    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end
    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
    it 'contains the correct content' do
      expect(response.body).to include 'New Category'
    end
  end
  describe 'POST /create' do
    before do
      sign_in @user
      post categories_path, params: { category: { name: 'Education', icon: '' } }
    end

    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:found)
    end
    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
    it 'contains the correct content' do
      get categories_path
      expect(response.body).to include 'Education'
    end
  end
end