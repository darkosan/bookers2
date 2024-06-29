class UsersController < ApplicationController
   before_action :is_matching_login_user, only: [:edit, :update]

  def index
   @book = Book.new
   @books = Book.all
   @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(book_params)
    redirect_to user_path(@user.id)
  end

  def users_index
    @users = User.all
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_image)
  end

  def is_matching_login_user
   user = User.find(params[:id])
   unless user.id == current_user.id
    redirect_to bookes_path
   end
  end
end
