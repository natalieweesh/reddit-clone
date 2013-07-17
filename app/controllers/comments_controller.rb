class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      redirect_to link_url(@comment.link.id)
    else
      flash[:error] = "could not create new comment"
      redirect_to :back
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

end