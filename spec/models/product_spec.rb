require 'rails_helper'

RSpec.describe Product, type: :model do
 describe 'Validations' do
   # validation tests/examples here

   cat = Category.new(name: "test")
  
   subject = cat.products.new(name: "Anything", price: 1,
                       quantity: 10)


   it "is valid with valid attributes" do
     expect(subject).to be_valid
   end

   it "is not valid without a name" do
     subject.name = nil
     expect(subject).to_not be_valid
     expect(subject.errors.full_messages).to include "Name can't be blank"
   end

   it "is not valid without a price" do
     subject.price_cents = nil
     expect(subject).to_not be_valid
     expect(subject.errors.full_messages).to include "Price can't be blank"
   end

   it "is not valid without a quantity" do
     subject.quantity = nil
     expect(subject).to_not be_valid
     expect(subject.errors.full_messages).to include "Quantity can't be blank"
   end

   it "is not valid without a category" do
     subject.category = nil
     expect(subject).to_not be_valid
     expect(subject.errors.full_messages).to include "Category can't be blank"
   end
 end
end