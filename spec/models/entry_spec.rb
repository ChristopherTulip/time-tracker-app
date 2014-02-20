require 'spec_helper'

describe Entry do
  it "should have a valid facotry" do
    expect( build(:entry) ).to be_valid
  end

  it "should validate presence of a user" do
    expect(build(:entry, user: nil)).to_not be_valid
  end

  it "should validate presence of a start time" do
    expect(build(:entry, started_at: nil)).to_not be_valid
  end

  it "should validate that end time is greater than start time" do
    expect( build(:entry, ended_at: (Time.now - 1.week) ) ).to_not be_valid
  end

end
