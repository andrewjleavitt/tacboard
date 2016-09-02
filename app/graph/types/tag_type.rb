TagType = GraphQL::ObjectType.define do
  name 'Tag'
  description 'Tags!'

  field :id, !types.String, property: :id
  field :name, !types.String, property: :name
end
