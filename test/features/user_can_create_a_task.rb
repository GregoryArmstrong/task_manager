require_relative '../test_helper'

class UserCanCreateATaskTest < FeatureTest

  def test_user_can_create_a_task_with_valid_attributes
    visit '/tasks/new'

    fill_in('task[title]', :with => 'Testing the Task Title')
    fill_in('task[description]', :with => 'Testing the Task Description')
    click_button('submit')

    assert_equal '/tasks', current_path
    within('#tasks') do
      assert page.has_content?('Testing the Task Title')
    end
  end

end
