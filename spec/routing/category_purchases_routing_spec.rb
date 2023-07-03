require "rails_helper"

RSpec.describe CategoryPurchasesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/category_purchases").to route_to("category_purchases#index")
    end

    it "routes to #new" do
      expect(get: "/category_purchases/new").to route_to("category_purchases#new")
    end

    it "routes to #show" do
      expect(get: "/category_purchases/1").to route_to("category_purchases#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/category_purchases/1/edit").to route_to("category_purchases#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/category_purchases").to route_to("category_purchases#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/category_purchases/1").to route_to("category_purchases#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/category_purchases/1").to route_to("category_purchases#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/category_purchases/1").to route_to("category_purchases#destroy", id: "1")
    end
  end
end
