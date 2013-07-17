class SubsController < ApplicationController
  
  before_filter :authenticate
  before_filter :check_moderator, only: [:edit]

  def new
    @moderator = current_user
    @sub = Sub.new
  end

  def create
    @moderator = current_user
    @sub = Sub.new(params[:sub])
    # @sub = Sub.new(name:params[:sub][:name], user_id:params[:sub][:user_id])
    # @sub.links_attributes = params[:sub][:links_attributes].values
    if @sub.save!
      flash[:error] = "sub created successfully"
      redirect_to sub_url(@sub.id)
    else
      flash[:error] = "could not create new sub"
      render :new
    end
  end

  def show
    @sub = Sub.find(params[:id])
    @moderator = User.find(@sub.user_id)
  end

  def edit
    @moderator = current_user
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = Sub.find(params[:id])
    @sub.update_attributes(params[:sub])
    redirect_to sub_url(@sub.id)
  end

  private

  def check_moderator
    @current_user = current_user
    @sub = Sub.find(params[:id])
    unless @current_user.id == @sub.user_id
      flash[:error] = "you can't edit a sub that you didn't create"
      redirect_to new_sub_url
    end
  end

end
