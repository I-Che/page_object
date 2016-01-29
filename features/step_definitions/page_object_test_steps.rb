Given(/^Open registration page$/) do
   visit(RegistrationPage)
end

And(/^Register user by submit valid credentials$/) do
  @user = on(RegistrationPage).register
end

When(/^Logged user with valid credentials$/) do
  on(AccountPage).logout
  on(HomePage).login
  on(LoginPage).submit_valid_credentials(@user)
end

Then(/^User is logged in$/) do
  expect(on(HomePage).username_element.when_visible(10).text).to include @user
end

When(/^User change password$/) do
  on(AccountPage).to_password_page
  on(PasswordPage).new_password_creating
end

Then(/^Password was changed with message: (.*)$/) do |message|
  expect(on(PasswordPage).flash_notice_element.text).to include message
end

And(/^Password was updated in the database$/) do
  on(AccountPage).logout
  on(HomePage).login
  on(LoginPage).submit_new_login_infomation (@user)
end

When(/^New project was created$/) do
  on(AccountPage).to_project_page
  on(ProjectPage).new_project_creation
end

Then(/^It was appeared the message: (.*)$/) do |message|
  expect(on(ProjectPage).flash_notice_element.text).to include message
end

When(/^Version of new project was created$/) do
  on(ProjectPage).to_version_tab
  on(ProjectPage).new_version_creation
end

When(/^Add user to the project$/) do
  on(AccountPage).logout
  visit(RegistrationPage)
  on(RegistrationPage).register
  on(AccountPage).to_project_page
  on(ProjectPage).adding_project
  on(ProjectPage).new_project_creation
  on(ProjectPage).to_members_list
  on(ProjectPage).adding_members
end

When(/^Register user for members list$/) do
  on(AccountPage).logout
  visit(RegistrationPage)
  on(RegistrationPage).register
end

And(/^Registered user was added to the project$/) do
  on(MembersPage).to_members_list
  on(MembersPage).adding_new_member (@user)
end

Then(/^Verifying that user was added to the project$/) do
  expect(on(MembersPage).list_members_table).to include 'user'
  end

And(/^Added developer users role$/) do
 on(MembersPage).editing_users_roles
end

Then(/^In users roles list appeared developer role$/) do
  expect(on(MembersPage).list_members_table).to include 'Developer'
end

When(/^Created bug, feature and support issue$/) do
  on(IssuePage).adding_issue_bug
  on(IssuePage).adding_issue_feature
  on(IssuePage).adding_issue_support
  on(IssuePage).to_issues
end

Then(/^Bug, feature and support issue are visible on Issues_tab$/) do
  expect(on(IssuePage).issues_table).to include 'Support'
  expect(on(IssuePage).issues_table).to include 'Feature'
  expect(on(IssuePage).issues_table).to include 'Bug'
end