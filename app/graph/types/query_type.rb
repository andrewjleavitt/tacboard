QueryType = GraphQL::ObjectType.define do
  name 'Query'
  description ' make your queries here!'

  field :bookmark do
    type BookmarkType
    argument :id, !types.String
    resolve -> (root, args, ctx) {
      Bookmark.find(args[:id])
    }
  end
end
