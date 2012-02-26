require 'spec_helper'

describe ReturnMethod do

  def reset_return_method(options = {})
    @valid_attributes = {
      :id => 1,
      :method1 => "RSpec is great for testing too"
    }

    @return_method.destroy! if @return_method
    @return_method = ReturnMethod.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_return_method
  end

  context "validations" do
    
    it "rejects empty method1" do
      ReturnMethod.new(@valid_attributes.merge(:method1 => "")).should_not be_valid
    end

    it "rejects non unique method1" do
      # as one gets created before each spec by reset_return_method
      ReturnMethod.new(@valid_attributes).should_not be_valid
    end
    
  end

end