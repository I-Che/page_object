Feature: Redmine_test_positive
  Testing http://demo.redmine.org

 Background:
 Given Open registration page
 And Register user by submit valid credentials

  Scenario: Test user registration
  When Logged user with valid credentials
  Then User is logged in

 Scenario: Test changing password
    When User change password
    Then Password was changed with message: Пароль успешно обновлён.
    And Password was updated in the database

  Scenario: Test creating project and project version
    When New project was created
    Then It was appeared the message: Создание успешно.
    When Version of new project was created
    Then It was appeared the message: Создание успешно.

  Scenario: Test editing users roles in project
    When Register user for members list
    And New project was created
    And Registered user was added to the project
    Then Verifying that user was added to the project
    When Added developer users role
    Then In users roles list appeared developer role

   Scenario: Test creating all types of issues
     When New project was created
     And Created bug, feature and support issue
     Then Bug, feature and support issue are visible on Issues_tab