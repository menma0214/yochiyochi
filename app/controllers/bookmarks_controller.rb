class BookmarksController < ApplicationController
  before_action :require_login

  def index
    @bookmark_facilities = current_user.bookmark_facilities
    @bookmark_events = current_user.bookmark_events
    all_bookmarks = (@bookmark_facilities || [] ) + (@bookmark_events || [] )
    @bookmarks = Kaminari.paginate_array(all_bookmarks).page(params[:page]).per(5)
  end

  def create
    bookmarkable = find_bookmarkable
    if bookmarkable
      @bookmark = current_user.bookmarks.new(bookmarkable: bookmarkable)
      if @bookmark.save
        flash[:success] = t('bookmarks.create.success')
        redirect_to params[:current_url], format: :turbo_stream
      else
        flash[:danger] = t('bookmarks.create.danger')
        redirect_to params[:current_url], format: :turbo_stream
      end
    else
      flash[:danger] = t('bookmarks.create.danger')
      redirect_to params[:current_url]
    end
  end

  def destroy
    @bookmark = current_user.bookmarks.find(params[:id])
    @bookmark.destroy
    flash[:success] = t('bookmarks.destroy.success')
    redirect_to params[:current_url], format: turbo_stream
  end

  private

  def find_bookmarkable
    Rails.logger.debug "Finding bookmarkable with type: #{params[:bookmarkable_type]}, id: #{params[:bookmarkable_id]}"
    params[:bookmarkable_type].constantize.find(params[:bookmarkable_id])
  end
end
