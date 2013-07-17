class LinksController < ApplicationController
  
  before_filter :check_link_author, only: [:edit]

  def show
    @current_user = current_user
    @link = Link.find(params[:id])
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    @link.update_attributes(params[:link])
    @link.sub_ids = params[:link_sub][:sub_ids]
    redirect_to link_url(@link.id)
  end

private

  def check_link_author
    @current_user = current_user
    @link = Link.find(params[:id])
    unless @current_user.id == @link.user_id
      flash[:error] = "you can't edit a link that you didn't create"
      redirect_to link_url(@link.id) # or somewhere else ?!
    end
  end

end
