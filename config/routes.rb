Rails.application.routes.draw do
  resources :bookmarks

  post '/graphql', to: 'graphql#query'
end
