class CommentsController < ApplicationController
    before_action :signed_in_user, only: [:create, :destroy]
  def create
      @comment = Review.find_by(id: Rails.cache.read("revid")).comments.build(comment_params)
      if @comment.save
          flash[:success] = "Comment saved"
          redirect_to(:back)
      else
          redirect_to(:back)
      end
  end

  private

    def comment_params
        params.require(:comment).permit(:content, :review_id, :user_id)
    end
end
