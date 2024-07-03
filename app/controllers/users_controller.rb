class UsersController < ApplicationController
   before_action :is_matching_login_user, only: [:edit, :update]

  def index
   @book = Book.new
   @user = User.all
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    is_matching_login_user
    @user = User.find(params[:id])
  end

  def update
    is_matching_login_user
    @user = User.find(params[:id])
    if @user.update(user_params)
     flash[:notice] = "successfully　updated"
     redirect_to user_path(@user.id)
    else
      flash[:alert] = "Failed to update user: " + @user.errors.full_messages.join(", ")
      render :index
    end
  end

  def users_index
    @users = User.all
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_image, :introduction)
  end

  def is_matching_login_user
   user = User.find(params[:id])
   unless user.id == current_user.id
    redirect_to users_path
   end
  end
end
