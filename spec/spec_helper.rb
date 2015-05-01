require "sequel"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.disable_monkey_patching!
  config.order = :random

  DB = Sequel.sqlite

  config.before :each do
    DB.create_table(:items) do
      primary_key :id
      String :name
    end
  end

  config.after :each do
    DB.execute("DROP TABLE IF EXISTS items;")
  end
end
