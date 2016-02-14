require 'rails_helper'

describe "Beer" do

  let!(:brewery) { FactoryGirl.create :brewery, name:"Koff" }
  let!(:user) { FactoryGirl.create :user }

  before :each do
    visit signin_path
    fill_in('username', with:'Pekka')
    fill_in('password', with:'Foobar1')
    click_button('Log in')
  end

  it "" do
    visit new_beer_path
    fill_in('beer[name]', with:'UpseeriIPA')
    select('IPA', from:'beer[style]')
    select('Koff', from:'beer[brewery_id]')    

    expect{
      click_button "Create Beer"
    }.to change{Beer.count}.from(0).to(1)

  end
end
