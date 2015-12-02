require_relative '../test_helper'

class TaskManagerTest < Minitest::Test

  def test_task_can_be_created
    TaskManager.create({ title: "hells yeah",
                        description: "boo-yah" })

    task = TaskManager.find(1)

    assert_equal "hells yeah", task.title
    assert_equal "boo-yah", task.description
    assert_equal 1, task.id
  end

  def test_all_can_find_all_tasks_correctly
    TaskManager.create({ title: "title1", description: "description1" })
    TaskManager.create({ title: "title2", description: "description2" })
    TaskManager.create({ title: "title3", description: "description3" })

    tasks = TaskManager.all

    assert_equal "title1", tasks[0].title
    assert_equal "title2", tasks[1].title
    assert_equal "title3", tasks[2].title
    assert_equal "description1", tasks[0].description
    assert_equal "description2", tasks[1].description
    assert_equal "description3", tasks[2].description

    tasks.each do |task|
      assert task.is_a?(Task)
      assert task.title.include?("title")
      assert task.description.include?("description")
    end
  end

  def test_can_find_a_specific_task
    TaskManager.create({ title: "title1", description: "description1" })
    TaskManager.create({ title: "title2", description: "description2" })

    found = TaskManager.find(2)

    assert_equal "title2", found.title
    assert_equal "description2", found.description
  end

  def test_update_can_modify_an_existing_task
    TaskManager.create({ title: "title1", description: "description1" })
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
    TaskManager.create({ title: "title1", description: "description1" })

    found = TaskManager.find(1)

    assert found

    TaskManager.delete(1)

    found = TaskManager.all

    assert_equal [], found
  end

end
