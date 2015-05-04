class Task
  attr_reader(:type)


  define_method(:initialize) do |attributes|
    @type = attributes.fetch(:type)

  end

  define_singleton_method(:all) do
    returned_tasks = DB.exec('SELECT * FROM tasks;')
    tasks = []
    returned_tasks.each() do |task|
      type = task.fetch('type')
      tasks.push(Task.new({:type => type}))
  end
  tasks
end

  define_method(:==) do |another_task|
    self.type().==(another_task.type())
  end

  define_method(:save) do
    DB.exec("INSERT INTO tasks (type) VALUES ('#{@type}')")
  end


end
