class UsersController < ApplicationController
  
  before_filter :authenticate, except: [:new, :create, :show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      login(@user)
      redirect_to user_url(@user.id) 
    else
      flash[:error] = "could not create new user"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @subs = @user.subs
  end

end
