class PlansController < ApplicationController
  before_filter :authenticate_user!

  def index
    @plans = Plan.all
  end

  def show
    @plan = Plan.find(params[:id])
  end

end
