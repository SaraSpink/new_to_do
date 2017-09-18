require('rspec')
require('pg')
require('task')
require('spec_helper')

describe(Task) do
  describe("#==") do
    it ("is the same task if it has the same description") do
      task1 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => "1969-01-05 00:00:00"})
      task2 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => "1969-01-05 00:00:00"})
      expect(task1).to(eq(task2))
    end
  end

  describe(".all") do
    it ("is empty at first") do
      expect(Task.all()).to(eq([]))
    end
  end

  describe("#save") do
    it ("adds a task to the array of saved tasks") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => "1969-01-05 00:00:00"})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe("#list_id") do
    it("lets you read the list ID out") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => "1969-01-05 00:00:00"})
      expect(test_task.list_id()).to(eq(1))
    end
  end

  describe("#description") do
    it("lets you read the description out") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => "1969-01-05 00:00:00"})
      expect(test_task.description()).to(eq("learn SQL"))
    end
  end

  describe("#sort_by_due_date") do
    it("returns list in order of due date") do
      task1 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => "1969-01-05 00:00:00"})
      task1.save()
      task2 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => "1985-02-12 00:00:00"})
      task2.save()
      expect(Task.sort_by_due_date()).to(eq([task1, task2]))
    end
  end
end
