class NameCardsController < ApplicationController
  before_action :set_name_card, only: [:show, :edit, :update, :destroy]

  def index
    user = User.find(params[:user_id])
    @name_cards = @users.name_cards
  end

  def show
  end

  def new
    user = User.find(params[:user_id])
    @name_cards = @users.name_cards
  end

  def create
    user = User.find(params[:user_id])
    @name_card = NameCard.new(name_card_params)

    if @name_card.save
      redirect_to company_group_user_name_cards_path(params[:company_id],params[:group_id],params[:user_id])
      #redirect_to @name_card, notice: 'NameCard was successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @name_card.update(name_card_params)
      redirect_to company_group_user_name_card_path(params[:company_id],params[:group_id],params[:user_id],@name_card.id), notice: 'NameCard was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @name_card = NameCard.find(params[:id])
    @name_card.destroy
    redirect_to company_group_user_name_cards_path(params[:company_id],params[:group_id],params[:user_id])
  end

  private

  def set_name_card
    @name_cardi = NameCard.find(params[:id])
  end

  def name_card_params
    params.require(:name_card).permit(:name, :address, :fax, :tel, :url)
  end

end
