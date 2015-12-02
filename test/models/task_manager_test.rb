require_relative '../test_helper'

class TaskManagerTest < Minitest::Test

  def setup
    TaskManager.create({ title: "title1", description: "description1" })
    TaskManager.create({ title: "title2", description: "description2" })
    TaskManager.create({ title: "title3", description: "description3" })
  end

  def test_task_can_be_created
    task = TaskManager.find(1)

    assert_equal "title1", task.title
    assert_equal "description1", task.description
    assert_equal 1, task.id
  end

  def test_all_can_find_all_tasks_correctly
    tasks = TaskManager.all

    assert_equal "title1", tasks[0].title
    assert_equal "title2", tasks[1].title
    assert_equal "title3", tasks[2].title
    assert_equal "description1", tasks[0].description
    assert_equal "description2", tasks[1].description
    assert_equal "description3", tasks[2].description
  end

  def test_can_find_a_specific_task
    found = TaskManager.find(2)

    assert_equal "title2", found.title
    assert_equal "description2", found.description
  end

  def test_update_can_modify_an_existing_task
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
    found = TaskManager.find(1)

    assert found

    TaskManager.delete(1)

    found = TaskManager.all

    assert_equal 2, found.size
  end

end
