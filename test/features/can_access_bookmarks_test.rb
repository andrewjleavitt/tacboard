require "test_helper"

class CanAccessBookmarksTest < Capybara::Rails::TestCase
  test "Bookmarks list" do
    create(:bookmark)
    create(:other_bookmark)

    visit bookmarks_path
    body = JSON.parse(page.body)

    assert_equal(2, body.size)
    assert_equal body.first['title'], "100 Best Websites!"
    assert_equal body.first['url'], "http://www.superwebring.com/100-best-sites.html"
    assert_equal body.first['description'], "Remeber to read these later"
  end
end
