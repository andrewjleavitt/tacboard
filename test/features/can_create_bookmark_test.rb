require "test_helper"

class CanCreateBookmarkTest < Capybara::Rails::TestCase
  test "can create a bookmark" do
    attributes = attributes_for(:bookmark)
    visit bookmarks_path attributes

    body = JSON.parse(page.body)

    assert_equal(page.status_code, 200)
  end
end
