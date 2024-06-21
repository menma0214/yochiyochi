class ReviewsController < ApplicationController
  before_action :set_facility, only: %i[index new create]
  before_action :set_review, only: %i[show destroy]
  before_action :set_facility_from_review, only: %i[destroy]

  def index
    @reviews = @facility.reviews.includes(:user).order(created_at: :desc).page(params[:page])
  end

  def new
    #初期化
    @review = @facility.reviews.new
  end

  def show
  end

  def create
    @review = @facility.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      redirect_to facility_reviews_path, success: t('defaults.flash_messages.created', item: Review.model_name.human)
    else
      flash.now[:danger] = t('defaults.flash_messages.not_created', item: Review.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # ビューに関わらず、サーバーサイドからもセキュリティの観点からユーザー認証
    if @review.user == current_user
      @review.destroy!
      redirect_to facility_reviews_path(@facility), success: t('defaults.flash_messages.deleted', item: Review.model_name.human), status: :see_other
    else
      redirect_to facility_reviews_path(@facility), status: :forbidden
    end
  end


  private

  def review_params
    params.require(:review).permit(:title, :body)
  end

  def set_facility
    @facility = Facility.find(params[:facility_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  # destroyアクションで@reviewから@facilityを取得するために、set_facility_from_reviewというプライベートメソッドを追加。
  # このメソッドをdestroyアクションの前に呼び出すようにする。
  #　set_facility_from_reviewをしないと削除はできても削除完了後にfacility_reviews_path(@facility)が見つからないというエラーが発生する。
  def set_facility_from_review
    @facility = @review.facility
  end
end
