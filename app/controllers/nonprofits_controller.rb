class NonprofitsController < ApplicationController

  def index
    @nonprofits = Nonprofit.all
  end

  def new
    @nonprofit = Nonprofit.new
  end

  def create
    @nonprofit = Nonprofit.create(nonprofit_params)
    if @nonprofit.valid?
      flash[:notice] = "Your Non-Profit has been added!"
      redirect_to nonprofits_path
    else
      flash[:alert] = "Something went wrong. Please try again."
      render "new"
    end
  end

  def show
    @nonprofit = Nonprofit.find(params[:id])
  end

  def edit
    @nonprofit = Nonprofit.find(params[:id])
  end

  def update
    @nonprofit = Nonprofit.find(params[:id])
    if @nonprofit.update(nonprofit_params)
      flash[:notice] = "Your Non-Profit has been edited."
      redirect_to nonprofit_path(@nonprofit)
    else
      flash[:alert] = "Something went wrong. Please try again."
      render "edit"
    end
  end

  def destroy
    @nonprofit = Nonprofit.find(params[:id])
    @nonprofit.destroy
    flash[:notice] = "Your Non-Profit has been exterminated! EXTERMINATED!"
    redirect_to nonprofits_path
  end

private
  def nonprofit_params
    params.require(:nonprofit).permit(:name)
  end
end
