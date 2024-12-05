# app/controllers/comments_controller.rb
class CommentsController < ApplicationController
  before_action :set_review, only: %i[create]
  before_action :require_login
  before_action :set_comment, only: %i[edit update destroy]

  def create
    @comment = @review.comments.build(comment_params)
    @comment.user = current_user # current_userを直接割り当て
    # Rails.logger.info "Comment user: #{@comment.user.inspect}"

    if @comment.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to review_path, notice: 'Comment was successfully created.' }
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream { render turbo_stream: turbo_stream.replace("form", partial: "form", locals: { comment: @comment }) }
      end
    end
  end

  def edit
  end

  def update
    @comment.reload unless @comment.update(comment_params)
  end

  def destroy
    @comment.destroy!
  end

  private

  def set_review
    @review = Review.find(params[:review_id])
    if @review.reviewable_type == "Facility"
      @facility = @review.reviewable
    elsif @review.reviewable_type == "Event"
      @event = @review.reviewable
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_comment
    @comment = current_user.comments.find(params[:id])
  end
end
