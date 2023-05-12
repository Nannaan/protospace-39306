class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: "ユーザーを作成しました。"
    else
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
    @name = @user.name
    @prototypes = @user.prototypes
  end

  private

  def user_params
    params.require(:user).permit(:email, :encrypted_password, :name, :profile, :occupation, :position)
  end
end
