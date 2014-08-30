class GroupsController < ApplicationController
  before_action :set_company
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @company = Company.find(params[:company_id])
    @group = @company.groups.new
    @groups = @company.groups.order(:name).page(params[:page])
  end

  def show
  end

  def new
    #company = Company.find(params[:company_id])
    @group = @company.groups.new
  end

  def create
    #company = Company.find(params[:company_id])
    @group = @company.groups.new(group_params)

    if @group.save
      redirect_to company_groups_path(params[:company_id]), notice: 'Group was successfully updated.'
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to company_group_path(@group.company_id,@group.id), notice: 'Group was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @group.destroy
    redirect_to company_groups_path(params[:company_id])
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name)
  end

end
