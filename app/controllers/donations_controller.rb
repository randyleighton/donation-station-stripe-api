class DonationsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @donations = Donation.all
  end

  def new
    @nonprofit = Nonprofit.find(params[:nonprofit_id])
    @donation = Donation.new
  end

  def create
    @nonprofit = Nonprofit.find(params[:nonprofit_id])
    @donation = Donation.create(donation_params)
    if @donation.valid?
      flash[:notice] = "Thank you for your donation!"
      redirect_to nonprofit_path(@nonprofit)
    else
      render "new"
    end
  end

  def show
    @donation = Donation.find(params[:id])
  end

  def destroy
    @donation = Donation.find(params[:id])
    @donation.destroy
    flash[:notice] = "Your donation has been exterminated! EXTERMINATED!"
    redirect_to donations_path
  end

private
  def donation_params
    params.require(:donation).permit(:amount, :token, :nonprofit_id).merge(:user_id => current_user.id)
  end
end
