class NameCardsController < ApplicationController
  before_action :set_user
  before_action :set_name_card, only: [:show, :edit, :update, :destroy]

  def index
    user = User.find(params[:user_id])
    @name_cards = user.name_cards.order(:name).page(params[:page])
  end

  def show
  end

  def new
    user = User.find(params[:user_id])
    @name_card = user.name_cards.new
  end

  def create
    user = User.find(params[:user_id])
    @name_card = user.name_cards.create(name_card_params)
    if @name_card.save
      redirect_to company_group_users_path(user.group_id, user.id), notice: 'Group was successfully updated.'
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @name_card.update(name_card_params)
      redirect_to company_group_user_path(@name_card.user.group.company_id, @name_card.user.group.id, @name_card.user.id, @name_card.id) , notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @name_card.destroy
    redirect_to company_group_users_path(@name_card.user.group.company_id, @name_card.user.group.id, @name_card.user.id, @name_card.id)
  end

  private

  def set_name_card
    @name_card = NameCard.find(params[:id])
  end

  def name_card_params
    params.require(:name_card).permit(:name, :address, :fax, :tel, :url)
  end

end
