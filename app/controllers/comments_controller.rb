class CommentsController < ApplicationController

  def create
    @comment = current_user.authored_comments.new(comment_params)
    if @comment.save
      redirect_to @comment.commentable
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to @comment.commentable
    end
  end

  def destroy
  end

  private

    def comment_params
      params.require(:comment).permit(:commentable_type, :commentable_id, :body)
    end

end
