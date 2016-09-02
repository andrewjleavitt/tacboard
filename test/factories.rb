FactoryGirl.define do
  factory :tag do
    name "MyString"
    bookmark nil
  end
  factory :other_bookmark, class: Bookmark do
    title 'One Weird Trick'
    url 'http://www.spamsite.com/wierdtricks'
    description 'Gotta try this'
    created_at '2016-01-01'
  end

  factory :bookmark do
    title '100 Best Websites!'
    url 'http://www.superwebring.com/100-best-sites.html'
    description 'Remeber to read these later'
    created_at '2016-01-01'
  end
end
