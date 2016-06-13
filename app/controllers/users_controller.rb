class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(users_params)
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  private
    def users_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
