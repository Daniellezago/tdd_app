require 'rails_helper'

RSpec.describe Customer, type: :model do
  it "is valid with valid attributes" do 
    customer = build(:customer)
    expect(customer).to be_valid    
  end

  it "is invalid without a name" do 
    customer = build(:customer, name: nil)
    expect(customer).not_to be_valid
  end

  it "is invalid without an email" do
    customer = build(:customer, email: nil)
    expect(customer).not_to be_valid
  end
end
