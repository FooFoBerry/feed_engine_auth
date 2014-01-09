require 'spec_helper'

describe User do
  it "should be valid with correct attributes" do 
    user = FactoryGirl.build(:user)
    expect(user.valid?).to be_true
  end

  it "should be invalid with duplicate uid" do 
    user = FactoryGirl.create(:user)
    duplicate_user = FactoryGirl.build(:user)
    expect(duplicate_user.valid?).to be_false
  end

  it "should be invalide without a uid" do
    user = FactoryGirl.build(:user, :uid => nil)
    expect(user.valid?).to be_false 
  end
end
