require "test_helper"

# To be handled correctly this spec must end with "Integration Test"
describe "Bookmarks Integration Test" do
  test "can access the bookmarks list" do
    create(:bookmark)
    create(:other_bookmark)

    get "/bookmarks"
    body = JSON.parse(response.body)

    assert_equal(2, body.size)
    assert_equal body.first['title'], "100 Best Websites!"
    assert_equal body.first['url'], "http://www.superwebring.com/100-best-sites.html"
    assert_equal body.first['description'], "Remeber to read these later"
  end

  test "can show a bookmark" do
    bookmark = create(:bookmark)

    get bookmark_url(bookmark.id)

    assert_equal @response.response_code, 200
    body = JSON.parse(response.body)
    assert_equal body['title'], "100 Best Websites!"
    assert_equal body['url'], "http://www.superwebring.com/100-best-sites.html"
    assert_equal body['description'], "Remeber to read these later"
  end

  test "can create a bookmark" do
    bookmark_attributes = attributes_for(:bookmark)

    post bookmarks_path bookmark: bookmark_attributes
    assert_equal(@response.response_code, 201)

    assert_equal(1, Bookmark.all.size)
    assert_equal Bookmark.first.title, "100 Best Websites!"
    assert_equal Bookmark.first.url, "http://www.superwebring.com/100-best-sites.html"
    assert_equal Bookmark.first.description, "Remeber to read these later"
  end

  test "can update a bookmark" do
    bookmark = create(:bookmark)

    patch bookmark_url(bookmark), params: { bookmark: { title: '101 Best Websites' } }

    assert_equal @response.response_code, 204

    bookmark.reload
    assert_equal bookmark.title, '101 Best Websites'
  end
end
