require 'spec_helper'

describe User do
  it "should have a valid factory" do
    expect(build(:user)).to be_valid
  end

  it "should validate email" do
    expect(build(:user, email: nil)).to_not be_valid
  end

  it "should validate on password" do
    expect( build(:user, password: nil) ).to_not be_valid
  end

end
