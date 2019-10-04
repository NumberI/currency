require "rails_helper"

describe Rate do 
  
  it {should validate_presence_of :val }
  
  it "should be valid" do 
    Rate.new(val: 123, fixed_till: 2.days.after).should be_valid
  end

end