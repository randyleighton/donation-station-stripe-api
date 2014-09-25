class TransfersController < ApplicationController
  before_filter :authenticate_user!

  def new
    @nonprofit = Nonprofit.find(params[:nonprofit_id])
    @transfer = Transfer.new
  end

  def create
    @nonprofit = Nonprofit.find(params[:nonprofit_id])
    @transfer = Transfer.create(transfer_params)
    if @transfer.valid?
      flash[:notice] = "Money has been sent!"
      redirect_to nonprofit_path(@nonprofit)
    else
      render "new"
    end
  end

  def show
    @transfer = Transfer.find(params[:id])
  end

  private

  def transfer_params
    params.require(:transfer).permit(:nonprofit_id, :amount)
  end
end

