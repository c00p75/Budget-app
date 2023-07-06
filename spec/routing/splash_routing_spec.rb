require 'rails_helper'

RSpec.describe 'Splash Route', type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/budget_wiz').to route_to('splash#index')
    end
  end
end
