BookmarkType = GraphQL::ObjectType.define do
  name 'Bookmark'
  description 'BookmarkTypes'

  field :id, !types.String, property: :id
  field :url, !types.String, property: :url
  field :title, !types.String, property: :title
  field :description, !types.String, property: :description
  field :tags do
    type -> { types[TagType] }
    resolve -> (bookmark, args, ctx) { bookmark.tags }
  end
end
