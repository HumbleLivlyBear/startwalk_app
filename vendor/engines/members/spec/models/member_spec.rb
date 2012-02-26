require 'spec_helper'

describe Member do

  def reset_member(options = {})
    @valid_attributes = {
      :id => 1,
      :member_name => "RSpec is great for testing too"
    }

    @member.destroy! if @member
    @member = Member.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_member
  end

  context "validations" do
    
    it "rejects empty member_name" do
      Member.new(@valid_attributes.merge(:member_name => "")).should_not be_valid
    end

    it "rejects non unique member_name" do
      # as one gets created before each spec by reset_member
      Member.new(@valid_attributes).should_not be_valid
    end
    
  end

end