require 'selenium-webdriver'
require 'rspec'
require 'page-object'
# require_relative  '../../features/support/pages/uniting_page'
# require_relative '../../features/support/pages/registration_page'
# require_relative '../../features/support/pages/login_page'
# require_relative '../../features/support/pages/account_page'
# require_relative '../../features/support/pages/password_page'
# require_relative '../../features/support/pages/project_page'
World(RSpec::Matchers)
World(PageObject::PageFactory)