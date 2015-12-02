require_relative '../test_helper'

class UserCanDeleteAnExistingTaskTest < FeatureTest

  def test_user_can_delete_an_existing_task
    TaskManager.create(title: "DeleteTaskTestTitle", description: "DeleteTaskTestDescription")
    visit '/tasks'

    assert_equal '/tasks', current_path
    assert page.has_content?("DeleteTaskTestTitle")

    click_button('Delete')

    refute page.has_content?("DeleteTaskTestTitle")
  end

end
