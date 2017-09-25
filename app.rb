
require("sinatra")
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
  name = params['name']
  @list = List.new({:name => name})
  @list.save
  erb(:list_success)
end

get("/lists/show") do
  redirect("/")
end
