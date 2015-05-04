require('sinatra')
require('sinatar/reloader')
also_reload('lib/**/*.rb')
require('./lib/task')
requier('pg')

DB = PG.connect({:dbname => "to_do_list"})

get('/') do
  @task = Task.all()
  erb(:index)
end

post('/tasks') do
  description = params.fetch('type')
  task = Task.new({:type => type})
  task.save()
  erb(:success)
end
