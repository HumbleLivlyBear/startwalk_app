@return_methods
Feature: Return Methods
  In order to have return_methods on my website
  As an administrator
  I want to manage return_methods

  Background:
    Given I am a logged in refinery user
    And I have no return_methods

  @return_methods-list @list
  Scenario: Return Methods List
   Given I have return_methods titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of return_methods
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @return_methods-valid @valid
  Scenario: Create Valid Return Method
    When I go to the list of return_methods
    And I follow "Add New Return Method"
    And I fill in "Method1" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 return_method

  @return_methods-invalid @invalid
  Scenario: Create Invalid Return Method (without method1)
    When I go to the list of return_methods
    And I follow "Add New Return Method"
    And I press "Save"
    Then I should see "Method1 can't be blank"
    And I should have 0 return_methods

  @return_methods-edit @edit
  Scenario: Edit Existing Return Method
    Given I have return_methods titled "A method1"
    When I go to the list of return_methods
    And I follow "Edit this return_method" within ".actions"
    Then I fill in "Method1" with "A different method1"
    And I press "Save"
    Then I should see "'A different method1' was successfully updated."
    And I should be on the list of return_methods
    And I should not see "A method1"

  @return_methods-duplicate @duplicate
  Scenario: Create Duplicate Return Method
    Given I only have return_methods titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of return_methods
    And I follow "Add New Return Method"
    And I fill in "Method1" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 return_methods

  @return_methods-delete @delete
  Scenario: Delete Return Method
    Given I only have return_methods titled UniqueTitleOne
    When I go to the list of return_methods
    And I follow "Remove this return method forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 return_methods
 