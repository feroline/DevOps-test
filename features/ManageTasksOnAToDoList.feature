Feature: Manage tasks on a to-do list

  As a user, I want to manage a list of tasks.
  I should be able to add a new task with a name and a future due date.
  After saving a task, I should see it in the list and be able to add more tasks or remove existing ones.
  
  Rule: The due date must be in the future, and only one task can be added or removed at a time.
  
  Scenario: Verify navigation to the creation page
    Given I am on the home page
    When I click the "Add Todo" button
    Then I should be on the task creation page
  
  Scenario: Add a task with valid data
    Given I am on the task creation page
    When I fill in the "Task" input with "New Todo"
    And I fill in the "Due Date" input with "09/10/2030"
    And I click the "Save" button
    Then I should see the "Success!" message
    And the new task "New Todo" should be visible in the list
  
  Scenario: Add a task with an empty description
    Given I am on the task creation page
    When I don't fill the "Task" input
    And I fill in the "Due Date" input with "09/10/2030"
    And I click the "Save" button
    Then I should see the message "Fill the task description"
    And I should remain on the task creation page
  
  Scenario: Add a task with an empty date
    Given I am on the task creation page
    When I fill in the "Task" input with "New Todo"
    And I don't fill the "Due Date" input
    And I click the "Save" button
    Then I should see the message "Fill the due date"
    And I should remain on the task creation page
  
  Scenario: Add a task with a past date
    Given I am on the task creation page
    When I fill in the "Task" input with "New Task"
    And I fill in the "Due Date" input with "09/10/2001"
    And I click the "Save" button
    Then I should see the message "The due date must not be in the past"
    And I should remain on the task creation page
  
  Scenario: Remove a task from the list
    Given I am on the home page
    And a task named "Task to Delete" exists in the list
    When I click the "Remove" button for the task "Task to Delete"
    Then I should see the "Success" message
    And the task "Task to Delete" should no longer be in the list