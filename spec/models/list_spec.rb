require 'rails_helper'

RSpec.describe List, type: :model do
  describe '#complete_all_tasks!' do
    it 'should mark all tasks from the list as complete' do
      list = List.create(name: "chores")
      
      Task.create(
                  name: "Brush teeth",
                  description: "Whitning",
                  priority: 1,
                  deadline: Time.now,
                  complete: false,
                  duration: 60,
                  favorite: true,
                  list_id: list.id
                  )

      Task.create(
                  name: "Clean up room",
                  description: "cleaning",
                  priority: 2,
                  deadline: Time.now,
                  complete: false,
                  duration: 120,
                  favorite: false,
                  list_id: list.id
                  )

      Task.create(
                  name: "Rake the Leaves",
                  description: "outsideness",
                  priority: 3,
                  deadline: Time.now,
                  complete: false,
                  duration: 25,
                  favorite: true,
                  list_id: list.id
                  )

      list.complete_all_tasks!

      list.tasks.each do |task|
        expect(task.complete).to eq(true)
      end
    end
  end

  describe '#snooze_all_tasks!' do
    it 'should snooze all the tasks on the list' do
      list = List.create(name: "Snooze")
      list.snooze_all_tasks!
      list.tasks.each do |task|
        expect(task.snooze_hour!).to eq(true)
      end
    end
  end

  describe '#total_duration' do
    it 'should return the total amount of time it takes to complete all tasks' do
      list = List.create(name: "Time Needed")

      Task.create(
                  name: "Brush teeth",
                  duration: 60,
                  list_id: list.id
                  )

      Task.create(
                  name: "Clean up room",
                  duration: 120,
                  list_id: list.id
                  )

      Task.create(
                  name: "Rake the Leaves",
                  duration: 25,
                  list_id: list.id
                  )
      expect(list.total_duration).to eq(205)
    end
  end

  describe '#incomplete_tasks' do
    it 'should list all of the tasks that have not been completed' do
      list = List.create(name: "chores")
      
      Task.create(
                  name: "Brush teeth",
                  complete: false,
                  list_id: list.id
                  )

      Task.create(
                  name: "Clean up room",
                  complete: false,
                  list_id: list.id
                  )

      Task.create(
                  name: "Rake the Leaves",
                  complete: false,
                  list_id: list.id
                  )

      expect(list.incomplete_tasks).to eq(false)
    end
  end
end


