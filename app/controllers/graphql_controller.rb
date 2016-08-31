class GraphqlController < ApplicationController

  def query
    result_hash = Schema.execute(params[:query], variables: params[:variables])
    render json: result_hash
  end
end