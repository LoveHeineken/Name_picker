class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = group.users.order(:name).page params[:page]
  end

  def show
  end

  def new
    group = Group.find(params[:group_id])
    @user = group.users.new
  end

  def create
    group = Group.find(params[:group_id])
    @user = group.users.create(user_params)
    if @user.save
      redirect_to company_group_users_path(group.company_id,group.id)
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to company_group_user_path(@user.group.company_id,@user.group.id,@user.id) , notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to company_group_users_path(@user.group.company_id,@user.group.id)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :mail, :tel)
  end

end
