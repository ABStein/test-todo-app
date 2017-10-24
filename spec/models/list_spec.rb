require 'rails_helper'

RSpec.describe List, type: :model do
  describe '#complete_all_tasks!' do
    it 'should switch all completes to false if it began as true' do
      list = List.create(name: "chores")
      task1 = Task.create(name: "Brush teeth",
                          description: "Whitning",
                          priority: 1,
                          deadline: Time.now,
                          complete: false,
                          duration: 60,
                          favorite: true,
                          list_id: list.id
                          ) 
      task2 = Task.create(name: "Clean up room",
                          description: "cleaning",
                          priority: 2,
                          deadline: Time.now,
                          complete: false,
                          duration: 120,
                          favorite: false,
                          list_id: list.id
                          ) 
      task3 = Task.create(name: "Rake the Leaves",
                          description: "outsideness",
                          priority: 3,
                          deadline: Time.now,
                          complete: false,
                          duration: 25,
                          favorite: true,
                          list_id: list.id
                          ) 
    end
  end

end
