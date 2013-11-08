class PostsController < ApplicationController

  def show
    @source = Source.find(params[:source_id])
    @post = Post.find(params[:id])
  end

end
