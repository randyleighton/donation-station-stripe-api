class SubscriptionsController < ApplicationController
    before_filter :authenticate_user!

    def index
      @plans = Plan.all
    end

    def new
      @plan = Plan.find(params[:plan_id])
      @subscription = Subscription.new
    end

    def create
      @plan = Plan.find(params[:plan_id])
      @subscription = Subscription.create(subscription_params)
      if @subscription.valid?
        flash[:notice] = "Thank you for your subscription!"
        redirect_to plan_path(@plan)
      else
        render "new"
      end
    end

    def show
      @subscription = Subscription.find(params[:id])
    end

    def destroy
      @subscription = Subscription.find(params[:id])
      @subscription.destroy
      flash[:notice] = "Your subscription has been exterminated! EXTERMINATED!"
      redirect_to donations_path
    end

  private
    def subscription_params
      params.require(:subscription).permit(:token, :nonprofit_id, :plan_id).merge(:user_id => current_user.id)
    end
end
