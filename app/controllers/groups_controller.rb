class GroupsController < ApplicationController
  before_action :set_company
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = @company.groups
  end

  def show
  end

  def new
    @groups = @company.groups
    # @group = Group.new
  end

  def create
    @groups = @company.groups.new(group_params)
    # @group = Group.new(group_params)

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

  def group_params
    params.require(:group).permit(:name)
  end

end
