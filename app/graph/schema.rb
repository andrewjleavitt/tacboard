UpdateBookmarkMutation = GraphQL::Relay::Mutation.define do
  name 'UpdateBookmark'
  description 'Update Bookmarks'

  input_field :id, !types.ID
  input_field :title, !types.String
  input_field :url, !types.String
  input_field :description, !types.String

  resolve -> (inputs, ctx) {
    attributes = {
        id: inputs[:id],
        title: inputs[:title],
        url: inputs[:url],
        description: inputs[:description]
    }
    bookmark = Bookmark.find(inputs[:id])
    bookmark.update(attributes)
    {bookmark: bookmark}
  }
end

MutationType = GraphQL::ObjectType.define do
  field :updateBookmark, field: UpdateBookmarkMutation
end

Schema = GraphQL::Schema.define(
  query: QueryType,
  mutation: MutationType
)

