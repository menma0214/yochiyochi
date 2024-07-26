class ReviewsController < ApplicationController
  before_action :set_facility, only: %i[index new create]
  # before_action :set_event, only: %i[index new create]
  before_action :set_review, only: %i[show destroy edit update]
  before_action :set_facility_from_review, only: %i[edit destroy update]


  def index
    Rails.logger.debug "params[:facility_id]: #{params[:facility_id]}"
    Rails.logger.debug "params[:event_id]: #{params[:event_id]}"

    @facility_reviews = @facility.reviews.includes(:user).order(created_at: :desc) if @facility
    @event_reviews = @event.reviews.includes(:user).order(created_at: :desc) if @event

    all_reviews = (@facility_reviews || []) + (@event_reviews || [])

    # Kaminari のページネーションを適用
    @reviews = Kaminari.paginate_array(all_reviews).page(params[:page]).per(5)

    Rails.logger.debug "@reviews: #{@reviews.inspect}"
  end

def new
  if @facility
    @review = @facility.reviews.new
  elsif @event
    @review = @event.reviews.new
  else
    redirect_to facilities_path, alert: "Facility or Event not found"
  end
  end

  def create
    if @facility
      @review = @facility.reviews.build(review_params)
    elsif @event
      @review = @event.reviews.build(review_params)
    end
    @review.user = current_user
    if @review.save
      if @facility
        redirect_to facility_reviews_path(@facility), success: t('reviews.flash_messages.created', item: Review.model_name.human)
      elsif @event
        redirect_to event_reviews_path(@event), success: t('reviews.flash_messages.created', item: Review.model_name.human)
      end
    else
      flash.now[:danger] = t('reviews.flash_messages.not_created', item: Review.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      if @review.reviewable_type == 'Facility'
        redirect_to facility_reviews_path(@review.reviewable, @review), success: t('reviews.flash_messages.deleted', item: Review.model_name.human), status: :see_other
      elsif @review.reviewable_type == 'Event'
        redirect_to event_reviews_path(@review.reviewable, @review), success: t('reviews.flash_messages.deleted', item: Review.model_name.human), status: :see_other
      end
    else
      flash.now[:danger] = t('reviews.flash_messages.not_updated', item: Review.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @review.user == current_user
      @review.destroy!
      if @review.reviewable_type == 'Facility'
        redirect_to facility_reviews_path(@review.reviewable, @review), success: t('reviews.flash_messages.deleted', item: Review.model_name.human), status: :see_other
      elsif @review.reviewable_type == 'Event'
        redirect_to event_reviews_path(@review.reviewable, @review), success: t('reviews.flash_messages.deleted', item: Review.model_name.human), status: :see_other
      end
    else
      redirect_to facility_reviews_path(@review.reviewable, @review), status: :forbidden
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :image)
  end

  def set_facility
    if params[:facility_id]
      @facility = Facility.find_by(id: params[:facility_id])
    elsif params[:event_id]
      @event = Event.find_by(id: params[:event_id])
      @facility = @event.facility if @event
    end
    Rails.logger.debug "@facility: #{@facility.inspect}"
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def set_facility_from_review
    @review = Review.find(params[:id])
    @facility = @review.reviewable if @review.reviewable_type == 'Facility'
    @event = @review.reviewable if @review.reviewable_type == 'Event'
  end
end
