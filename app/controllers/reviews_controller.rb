class ReviewsController < ApplicationController
  before_action :set_facility_or_event, only: %i[index new show create edit update destroy]
  before_action :set_review, only: %i[show edit update destroy]

  def index
    Rails.logger.debug "params[:facility_id]: #{params[:facility_id]}"
    Rails.logger.debug "params[:event_id]: #{params[:event_id]}"

    @facility_reviews = @facility.reviews.includes(:user).order(created_at: :desc).page(params[:page]).per(5) if @facility
    @event_reviews = @event.reviews.includes(:user).order(created_at: :desc).page(params[:page]).per(5) if @event

    Rails.logger.debug "@facility_reviews: #{@facility_reviews.inspect}"
    Rails.logger.debug "@event_reviews: #{@event_reviews.inspect}"
  end

  def show
  end


  def new
    @review = @reviewable.reviews.build
  end

  def create
    @review = @reviewable.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      if @reviewable.is_a?(Facility)
        flash[:success] = t('reviews.flash_messages.created', item: Review.model_name.human)
        redirect_to facility_reviews_path(@reviewable)
      elsif @reviewable.is_a?(Event)
        flash[:success] = t('reviews.flash_messages.created', item: Review.model_name.human)
        redirect_to event_reviews_path(@reviewable)
      end
    else
      # ここはおそらく到達しないはずですが、念のためエラーハンドリングを追加
      flash[:danger] = t('reviews.flash_messages.not_created', item: Review.model_name.human)
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      if @reviewable.is_a?(Facility)
        flash[:success] = t('reviews.flash_messages.updated', item: Review.model_name.human)
        redirect_to facility_reviews_path(@reviewable)
      elsif @reviewable.is_a?(Event)
        flash[:success] = t('reviews.flash_messages.updated', item: Review.model_name.human)
        redirect_to event_reviews_path(@reviewable)
      end
    else
      flash[:danger] = t('reviews.flash_messages.not_updated', item: Review.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @review.user == current_user
      @review.destroy!
      if @reviewable.is_a?(Facility)
        flash[:success] = t('reviews.flash_messages.deleted', item: Review.model_name.human)
        redirect_to facility_reviews_path(@reviewable)
      elsif @reviewable.is_a?(Event)
        flash[:success] = t('reviews.flash_messages.deleted', item: Review.model_name.human)
        redirect_to event_reviews_path(@reviewable)
      end
    else
      flash[:success] = t('reviews.flash_messages.deleted', item: Review.model_name.human)
      redirect_to root_path, status: :forbidden
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :rate, :image)
  end

  def set_facility_or_event
    if params[:facility_id]
      @reviewable = Facility.find(params[:facility_id])
      @facility = @reviewable
    elsif params[:event_id]
      @reviewable = Event.find(params[:event_id])
      @event = @reviewable
    end
    Rails.logger.debug "@reviewable: #{@reviewable.inspect}"
  end

  def set_review
    @review = @reviewable.reviews.find(params[:id])
  end
end
