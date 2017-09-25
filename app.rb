
require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/task")
require("./lib/list")
require("pg")


get("/") do
  erb(:index)
end

get('/tasks/:id/edit') do
  @task = Task.find(params.fetch("id").to_i())
  erb(:task_edit)
end

patch("/tasks/:id") do
  description = params.fetch("description")
  @task = Task.find(params.fetch("id").to_i())
  @task.update({:description => description})
  @tasks = Task.all()
  erb(:index)
end

get("/lists/new") do
  list = List.new({:name => name, :id => nil, :due_date => due_date})
  list.save()
  erb(:add_list)
end

# post("/lists") do
#   name = params.fetch("name")
#   list = List.new({:name => name, :id => nil, :due_date => due_date})
#   list.save()
#   erb(:list_success)
# end
#
# get('/lists') do
#   @lists = List.all()
#   erb(:lists)
# end
#
# get('/lists/:id') do
#   @list= List.find(params.fetch("id").to_i())
#   erb(:list)
# end
#
# post("/tasks") do
#   description = params.fetch("description")
#   list_id = params.fetch("list_id").to_i()
#   @list = List.find(list_id)
#   @task = Task.new({:description => description, :list_id => list_id, :due_date => due_date})
#   @task.save()
#   erb(:list_success)
# end
