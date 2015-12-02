require_relative '../test_helper'

class UserCanDeleteAnExistingTaskTest < FeatureTest

  def test_user_can_delete_an_existing_task
    TaskManager.create(title: "DeleteTaskTestTitle", description: "DeleteTaskTestDescription")
    visit '/tasks'

    assert_equal '/tasks', current_path
    within('#tasks') do
      assert page.has_content?("DeleteTaskTestTitle")
    end

    click_button('Delete')
    within('#tasks') do
      refute page.has_content?("DeleteTaskTestTitle")
    end
  end

end
