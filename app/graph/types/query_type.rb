QueryType = GraphQL::ObjectType.define do
  name 'Query'
  description 'Make your queries here!'

  field :bookmark do
    type BookmarkType
    argument :id, !types.String
    resolve -> (root, args, ctx) {
      Bookmark.find(args[:id])
    }
  end

  field :bookmarks do
    type -> { types[BookmarkType] }
    resolve -> (root, args, ctx) {
      Bookmark.all
    }
  end
end
