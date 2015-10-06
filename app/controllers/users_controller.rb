class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :is_admin?,      only: [:destroy, :dashboard]
  
  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      log_in @user
      remember @user
      flash[:success] = "Account was successfully created!"
      redirect_to @user
  	else
  		render 'new'
  	end
  end

  def edit
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile successfully updated!"
    else
      flash[:danger] = "Something went wrong"
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User account has been removed"
    redirect_to root_url
  end

  def dashboard
    @users = User.all
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :email, :password,
  			                           :password_confirmation)
  	end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in first"
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      flash[:danger] = "You can only edit your own profile"
      redirect_to root_url unless @user == current_user
    end

    def is_admin?
      redirect_to(root_url) unless current_user.admin?
    end

end
