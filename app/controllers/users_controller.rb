class UsersController < Clearance::UsersController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    working_params = user_params_revised
    working_params.delete(:password)
    if @user.update(working_params)
      redirect_to current_user
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    sign_out
    @user.destroy
    redirect_to root_path
  end

  private

  def user_from_params
    name = user_params.delete(:name)
    email = user_params.delete(:email)
    password = user_params.delete(:password)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.name = name
      user.email = email
      user.password = password
    end
  end

  def user_params_revised
    params.require(:user).permit(:name, :email, :password)
  end
end
