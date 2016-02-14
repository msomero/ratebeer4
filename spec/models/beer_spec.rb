require 'rails_helper'

RSpec.describe Beer, type: :model do
   it "create valid beer" do 
     beer =Beer.create name:"Upseeri IPA", style:"IPA"
     expect(beer).to be_valid
     expect(Beer.count).to eq(1)  
   end
   
   it"beer has no name" do
     beer = Beer.create style: "IPA"
     expect(beer).not_to be_valid
     expect(Beer.count).to eq(0)
   end

   it "beer has no style" do
     beer=Beer.create name:"Upseeri IPA"
     expect(beer).not_to be_valid
     expect(Beer.count).to eq(0)
   end 
end
