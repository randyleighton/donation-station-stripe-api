class DonationsController < ApplicationController

  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.create(donation_params)
    if @donation.valid?
      flash[:notice] = "Thank you for your donation!"
      redirect_to donations_path
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
    flash[:notice] = "Your Non-Profit has been exterminated! EXTERMINATED!"
    redirect_to donations_path
  end

private
  def donation_params
    params.require(:donation).permit(:amount, :token).merge(:nonprofit_id => @nonprofit.id)
  end
end
