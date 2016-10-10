class UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])
    @all_friends = @user.friends_users
    if params[:search]
      @user_friend = User.find_by_email(params[:search])
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

  def friends
    #Cowboy a bit.
    ids = params[:id].split(/_/)
    id = ids[0]
    friend_id = ids[1]
    @user = User.find(id.to_i)
    @user_friend = User.find(friend_id.to_i)
    @user.befriend!(@user_friend)
    ##Vice-Versa
    @user_friend.befriend!(@user)
    render 'friends'
  end

  private

  def user_params
      params.require(:user).permit(:name, :email)
  end
end
