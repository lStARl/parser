class ResourcesController < ApplicationController
  def index
    @resources = Resource.order(published_date: :desc).page params[:page]
  end
end
