class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update, :destroy ]
  before_action :is_logged_in_and_admin, only: [:dashboard]
  before_action :set_user, only: [:show, :update, :destroy ]

  def show
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      UserMailer.welcome_email(@user).deliver_now # Need to configure activejob so that this is a background process
      log_in @user
      remember @user
      flash[:success] = "Account was successfully created!"
      redirect_to @user
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update

    if @user.update_attributes(user_params)
      flash[:success] = "Profile successfully updated!"
      redirect_to @user
    else
      flash[:danger] = "Something went wrong"
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    UserMailer.account_cancelation_email(@user).deliver_now # Need to configure activejob so that this is a background process
    respond_to do |format|
      format.html { 
        redirect_to root_url
        flash[:success] = "User account has been removed" }
      format.js 
    end
  end

  def dashboard
    @users = User.order(name: :desc)
    @coffeeshops = Coffeeshop.where(approved: false)
  end


  private

    def set_user 
      @user = User.find(params[:id])
    end

  	def user_params
  		params.require(:user).permit(:name, :email, :password,
  			                           :password_confirmation, :bio,
                                   :location, :facebook_link,
                                   :twitter_link, :google_link,
                                   :instagram_link )
  	end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in first"
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      if @user != current_user && !current_user.admin?
        flash[:danger] = "You can only edit your own profile"
        redirect_to root_url unless @user == current_user
      end
    end

end
