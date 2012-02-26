require 'spec_helper'

describe Project do

  def reset_project(options = {})
    @valid_attributes = {
      :id => 1,
      :case_name => "RSpec is great for testing too"
    }

    @project.destroy! if @project
    @project = Project.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_project
  end

  context "validations" do
    
    it "rejects empty case_name" do
      Project.new(@valid_attributes.merge(:case_name => "")).should_not be_valid
    end

    it "rejects non unique case_name" do
      # as one gets created before each spec by reset_project
      Project.new(@valid_attributes).should_not be_valid
    end
    
  end

end