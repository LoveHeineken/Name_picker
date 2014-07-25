class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def set_company
    company_id = params[:company_id] ? params[:company_id] : params[:id]
    @company = Company.find(company_id)
  end

  def  set_group
    group_id = params[:group_id] ? params[:group_id] : params[:id]
    @group = Group.find(group_id)
  end

  def set_user
    user_id = params[:user_id] ? params[:user_id] : params[:id]
    @user = User.find(user_id)
  end

end
