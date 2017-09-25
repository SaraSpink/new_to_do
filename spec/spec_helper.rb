require("rspec")
require("pg")
require("sinatra/activerecord")
require("task")
require("list")

ENV['RACK_ENV'] = 'test'

RSpec.configure do |config|
  config.after(:each) do
    Task.all().each() do |task|
      task.destroy()
    end
  end
end

RSpec.configure do |config|
  config.after(:each) do
    List.all().each() do |task|
      task.destroy()
    end
  end
end
