require("rspec")
require("pg")
require("list")
require("task")

ENV['RACK_ENV'] = 'test'

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM lists *;")
    DB.exec("DELETE FROM task *;")
  end
end
