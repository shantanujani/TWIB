class UnitsController < ApplicationController
  
	def index
    @units = Unit.all
	end

  def show
    @unit = Unit.find_by_id(params["id"])
  end

def new
@unit = Unit.new

  end	

def create
    @unit = Unit.new
    @unit.amount = params[:units]
    if @unit.save
      redirect_to units_url
    else
      render 'new'
   end
end
	def edit
    @unit = Unit.find_by_id(params["id"])
  end

  def update
    @unit = Unit.find_by_id(params["id"])
    @unit.amount = params[:units]
   if @unit.save
      redirect_to units_url
    else
      render 'new'
    end
  end

  def destroy
    @unit = Unit.find_by_id(params[:id])
    @unit.destroy
    redirect_to units_url
  end
end

