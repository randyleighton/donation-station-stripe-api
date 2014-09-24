class PlansController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]


  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.create(plan_params)
    if @plan.valid?
      flash[:notice] = "Your plan has been added!"
      redirect_to subscriptions_path
    else
      render "new"
    end
  end

  def show
    @plan = Plan.find(params[:id])
  end

  private

  def plan_params
    params.require(:plan).permit(:name, :amount)
  end
end
