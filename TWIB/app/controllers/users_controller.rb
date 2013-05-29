class UsersController < ApplicationController

  def index
    @users = User.all
    end
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def create
    @user = User.new
    @user.user_first_name = params[:user_first_name]
    @user.user_last_name = params[:user_last_name]
    @user.unit = params[:unit]

    if @user.save
      redirect_to users_url
    else
      render 'new'
    end
  end

def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    @user.user_first_name = params[:user_first_name]
    @user.user_last_name = params[:user_last_name]

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
