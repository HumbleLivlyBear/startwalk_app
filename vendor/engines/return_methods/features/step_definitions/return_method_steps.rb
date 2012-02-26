Given /^I have no return_methods$/ do
  ReturnMethod.delete_all
end

Given /^I (only )?have return_methods titled "?([^\"]*)"?$/ do |only, titles|
  ReturnMethod.delete_all if only
  titles.split(', ').each do |title|
    ReturnMethod.create(:method1 => title)
  end
end

Then /^I should have ([0-9]+) return_methods?$/ do |count|
  ReturnMethod.count.should == count.to_i
end
