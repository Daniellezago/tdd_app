require 'rails_helper'

RSpec.describe "Customers", type: :request do
  describe "GET /index" do
    it "returns http success" do 
      create(:customer) 
      get customers_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do 
    it "returns http success" do
      customer = create(:customer)
      get customer_path(customer)
      expect(response).to have_http_status(:success)
    end
  end
end
