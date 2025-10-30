RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  #config.filter_run_when_matching :focus

  # 💡 Debug tip:
  # View the persisted test results:
  #   cat spec/examples.txt
  #
  # Re-run only the failed examples:
  #   bin/rspec --only-failures
  config.example_status_persistence_file_path = "spec/examples.txt"

  config.disable_monkey_patching!

  # Running one spec file uses the doc format; running all uses the dot format.
  if config.files_to_run.one?
    config.default_formatter = "doc"
  end

  # Instead, use: 
  # bin/rspec spec/test_spec.rb --profile
  # config.profile_examples = 10

  config.order = :random

  Kernel.srand config.seed
end

# | Line                                                                       | Meaning                                                                                             |
# | -------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
# | `RSpec.configure do`                                                       | Opens the RSpec configuration block — all settings go inside this.                                  |
# | `config.expect_with :rspec do`                                             | Configures how expectations (`expect`) work.                                                        |
# | `expectations.include_chain_clauses_in_custom_matcher_descriptions = true` | Improves custom matcher messages by including chained conditions for clearer failure output.        |
# | `config.mock_with :rspec do`                                               | Configures RSpec’s mocking framework.                                                               |
# | `mocks.verify_partial_doubles = true`                                      | Ensures mocked/stubbed methods exist on real objects — prevents invalid stubs or typos.             |
# | `config.shared_context_metadata_behavior = :apply_to_host_groups`          | Makes metadata from shared contexts automatically apply to groups using them.                       |
# | `config.filter_run_when_matching :focus`                                   | Runs only tests marked with `:focus` — useful for debugging specific examples.                      |
# | `config.example_status_persistence_file_path = "spec/examples.txt"`        | Saves test results so RSpec can re-run only failed examples using `--only-failures`.                |
# | `config.disable_monkey_patching!`                                          | Prevents RSpec from adding global methods like `describe` outside its namespace — keeps Ruby clean. |
# | `if config.files_to_run.one?`                                              | Checks if only one spec file is being executed.                                                     |
# | `config.default_formatter = "doc"`                                         | Uses the “documentation” formatter for readable output when running one file.                       |
# | `# config.profile_examples = 10`                                           | (Commented) Would show the 10 slowest tests — useful for performance profiling.                     |
# | `config.order = :random`                                                   | Runs specs in random order to reveal hidden dependencies.                                           |
# | `Kernel.srand config.seed`                                                 | Seeds Ruby’s random generator so test order can be reproduced.                                      |
# | `end`                                                                      | Closes the `RSpec.configure` block.                                                                 |
