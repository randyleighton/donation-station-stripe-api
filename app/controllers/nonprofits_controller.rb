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
  end
end
