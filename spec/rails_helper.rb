require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

Rails.root.glob('spec/support/**/*.rb').sort_by(&:to_s).each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end
RSpec.configure do |config|
  config.fixture_paths = [
    Rails.root.join('spec/fixtures')
  ]

  config.use_transactional_fixtures = true



  config.filter_rails_from_backtrace!
end


# A brief description of what this project does and who it's for

# | Line                                                                        | Meaning                                                                                                             |
# | --------------------------------------------------------------------------  | ------------------------------------------------------------------------------------------------------------------- |
# | `require 'spec_helper'`                                                     | Loads the basic RSpec configuration.                                                                                |
# | `ENV['RAILS_ENV']`                                                           | Ensures Rails runs in the test environment.                                                                        |
# | `require_relative '../config/environment'`                                  | Loads the Rails application environment.                                                                            |
# | `abort("The Rails environment is running in production mode!") if Rails.env.production?` | Prevents tests from running in production.                                                             |
# | `require 'rspec/rails'`                                                                  | Integrates RSpec with Rails features (models, controllers, etc.).                                      |
# | `Rails.root.glob('spec/support/**/*.rb').sort_by(&:to_s).each {`                         | Loads all helper/support files in `spec/support`.                                                      |
# | `begin ... rescue ... end`                                                               | Ensures migrations are up to date before running tests; aborts if pending migrations exist.            |
# | `ActiveRecord::Migration.maintain_test_schema!`                                          | Applies any pending migrations to the test database.                                                   |
# | `RSpec.configure do`                                                                     | config - Opens the main RSpec configuration block.                                                     |
# | `config.fixture_paths = [Rails.root.join('spec/fixtures')]`                              | Sets the location for test fixtures (sample data).                                                     |
# | `config.use_transactional_fixtures = true`                                               | Wraps each test in a database transaction for isolation.                                               |
# | `config.filter_rails_from_backtrace!`                                                    | Hides Rails internal frames from test failure backtraces.                                              |
# | `end`                                                                                    | Closes the `RSpec.configure` block.                                                                    |
