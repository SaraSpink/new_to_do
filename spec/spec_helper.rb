require("rspec")
require("pg")
require("sinatra/activerecord")

require("task")

ENV['RACK_ENV'] = 'test'

RSpec.configure do |config|
  config.after(:each) do
    Task.all().each() do |task|
      task.destroy()
    end
  end
end
