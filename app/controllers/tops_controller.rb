class TopsController < ApplicationController
  skip_before_action :require_login
  def index
    @facilities = Facility.all
  end
end
