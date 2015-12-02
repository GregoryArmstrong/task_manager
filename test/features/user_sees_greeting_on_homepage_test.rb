require_relative '../test_helper'

class UserSeesGreetingOnHomepageTest < FeatureTest

  def test_greeting_is_displayed
    visit '/'

    within('#greeting') do
      assert page.has_content?("Welcome to the TaskManager!")
    end
  end

end
