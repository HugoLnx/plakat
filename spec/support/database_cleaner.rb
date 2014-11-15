RSpec.configure do |c|
  c.before :all do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
  end

  c.before :each do
    DatabaseCleaner.start
  end

  c.after :each do
    DatabaseCleaner.clean
  end

  c.before :all, type: :feature do
    DatabaseCleaner.strategy = :truncation
  end
end
