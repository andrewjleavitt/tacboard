class BookmarksController < ApplicationController

  def index
    render json: Bookmark.all
  end

  def show
    render json: Bookmark.find(params[:id]), status: :ok
  end

  def create
    Bookmark.create(bookmark_params)
    render json: {}, status: :created
  end

  def update
    bookmark = Bookmark.find(params[:id])
    bookmark.update_attributes(bookmark_params)
    render json: bookmark, status: :no_content
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(
        :title,
        :url,
        :description,
        :id
    )
  end
end