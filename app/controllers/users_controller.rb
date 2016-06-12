class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end
  def create
    @users = User.new(users_params)
    
    respond_to do |format|
      if @users.save
        format.html { redirect_to @users, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @users }
      else
        format.html { render :new }
        format.json { render json: @users.errors, status: :unprocessable_entity }
      end
    end
  end
  private
    def users_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
