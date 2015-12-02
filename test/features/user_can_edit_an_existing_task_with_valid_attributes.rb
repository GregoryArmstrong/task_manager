require_relative '../test_helper'

class UserCanEditAnExistingTaskTest < FeatureTest

  def test_user_can_edit_a_task_with_valid_attributes
    TaskManager.create(title: "EditTaskTestTitle", description: "EditTaskTestDescription")
    visit '/tasks'

    assert_equal '/tasks', current_path

    click_link('edit_button')

    assert_equal '/tasks/1/edit', current_path

    fill_in('task[title]', :with => "EditedTaskTestTitle")
    fill_in('task[description]', :with => "EditedTaskTestDescription")
    click_button('submit')

    assert_equal '/tasks/1', current_path
    assert page.has_content?("EditedTaskTestTitle")
    assert page.has_content?("EditedTaskTestDescription")
  end

end
