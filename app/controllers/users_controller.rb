class UsersController < ApplicationController
    before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
    before_action :correct_user,   only: [:edit, :update]
    def destroy
        User.find(params[:id]).destroy
        flash[:success] = "User destroyed."
        redirect_to users_url
    end
  def new
      @user = User.new
  end
    def create
        @user = User.new(user_params)
        if @user.save
            sign_in @user
            flash[:success] = "Welcome to Days In!"
            redirect_to @user
            else
            render 'new'
        end

    end
    def show
        if signed_in?
        @user = User.find(params[:id])
        @reviews = @user.reviews.paginate(page: params[:page])
        @review = current_user.reviews.build if signed_in?
            else
            redirect_to signin_path
            end
        end
    def edit
        @user = User.find(params[:id])
    end
        def update
            @user = User.find(params[:id])
            if @user.update_attributes(user_params)
                flash[:success] = "Profile updated"
                sign_in @user
                redirect_to @user
                else
                redirect_to root_path
            end
        end
    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :dp,
                                     :password_confirmation)
    end
    
    # Before filters
    def admin_user
        redirect_to(root_url) unless current_user.admin?
    end
    def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user?(@user)
    end
end
