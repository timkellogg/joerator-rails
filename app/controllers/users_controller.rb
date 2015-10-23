class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :is_logged_in_and_admin, only: [:destroy, :dashboard]
  
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
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile successfully updated!"
      redirect_to @user
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
    @users = User.all.order(name: :desc)
    @ordered_users = @users.paginate(:page => params[:page], :per_page => 5)
    # @active_users  = @users.sort(revi)
  end

  private
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
