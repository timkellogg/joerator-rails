class UsersController < ApplicationController
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

  def destroy
    log_out @user if logged_in?
    flash[:success] = "You have successfully logged out!"
    redirect_to root_url
  end

  private 
  	def user_params
  		params.require(:user).permit(:name, :email, :password, 
  			                           :password_confirmation)
  	end
end
