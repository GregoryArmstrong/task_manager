require_relative '../test_helper'

class TaskManagerTest < Minitest::Test

  def create_tasks(num)
    num.times do |n|
      TaskManager.create({title: "title#{n+1}", description: "description#{n+1}"})
    end
  end

  def test_task_can_be_created
    create_tasks(1)
    task = TaskManager.find(1)

    assert_equal "title1", task.title
    assert_equal "description1", task.description
    assert_equal 1, task.id
  end

  def test_all_can_find_all_tasks_correctly
    create_tasks(3)
    tasks = TaskManager.all

    assert_equal "title1", tasks[0].title
    assert_equal "title2", tasks[1].title
    assert_equal "title3", tasks[2].title
    assert_equal "description1", tasks[0].description
    assert_equal "description2", tasks[1].description
    assert_equal "description3", tasks[2].description
  end

  def test_can_find_a_specific_task
    create_tasks(2)
    found = TaskManager.find(2)

    assert_equal "title2", found.title
    assert_equal "description2", found.description
  end

  def test_update_can_modify_an_existing_task
    create_tasks(1)
    TaskManager.update(1, { title: "title3", description: "description3" })

    found = TaskManager.find(1)

    assert_equal "title3", found.title
    assert_equal "description3", found.description

    TaskManager.update(1, { title: "title3", description: "description3" })

    found = TaskManager.find(1)

    assert_equal "title3", found.title
    assert_equal "description3", found.description
  end

  def test_can_delete_a_created_task
    create_tasks(3)
    found = TaskManager.find(1)

    assert found

    TaskManager.delete(1)

    found = TaskManager.all

    assert_equal 2, found.size
  end

end
