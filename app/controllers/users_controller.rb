class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def index
    @users = User.all

    respond_to do |format|
      format.html # show.html.erb      format.json { render json: @change_requests }
    end
  end
end
