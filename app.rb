
require("sinatra")
require("pry")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/task")
require("./lib/list")
require("pg")


get("/") do
  @list = List.all()
  erb(:index)
end

get("/list/new") do
  erb(:list_form)
end

post("/lists") do
  @name = params['name']
  @list = List.new({:name => @name})
  @list.save
  erb(:list_success)
end

get("/lists/show") do
  redirect("/")
end

get("/list/:id") do
  @list_id = List.find(params.fetch("id").to_i())
  @task = Task.all()
  erb(:task_form)
end

post("/task/new/:id") do
  @list_id = List.find(params.fetch("id").to_i())

  @description = params['description']
  @due_date = params['due_date']
  @task = Task.new({:description => @description, :done => false, :list_id => @list_id, :due_date => @due_date,})
  @task.save
  # erb(:task_form)
  redirect("/list/#{@list_id.id}")
end
