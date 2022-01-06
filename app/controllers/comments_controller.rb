class CommentsController < ApplicationController
  def def new
    @comment = Comment.new
  end

  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    respond_to do |format|
      if comment.save
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.append("post_#{params[:post_id]}_comments", partial: "comments/comment", locals: {comment: comment} )
          ]
      end

        format.html { redirect_to post_url(comment.post), notice: "comment added" }
      else
        format.html { redirect_to post_url(params[:post_id]), notice: "comment not added" }
      end
    end

  end

  private

    def comment_params
      params.require(:comment).permit(:user_id, :post_id, :message)
    end

end
