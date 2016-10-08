class UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])
    if params[:search]
      @user_friend = User.search(params[:search])
    end
  end
  
  def new
  	@user = User.new
  end

  def index
  	@users = User.paginate(page: params[:page])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You are now apart of Vince's little social network!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
      params.require(:user).permit(:name, :email)
  end
end
