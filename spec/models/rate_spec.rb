require "rails_helper"

describe Rate do 
  
  it {should validate_presence_of :val }
  
  it "should be valid" do 
    expect(Rate.new(val: 123, fixed_till: 2.days.after)).to be_valid
  end

end