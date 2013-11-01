class NameCardsController < ApplicationController
  before_action :set_name_card, only: [:show, :edit, :update, :destroy]

  def index
    @name_cards = NameCard.all
  end

  def show
  end

  def new
    @name_card = NameCard.new
  end

  def edit
  end

  def create
    @name_card = NameCard.new(name_card_params)
    respond_to do |format|
      if @name_card.save
        format.html { redirect_to @name_card, notice: 'Master article was successfully created.' }
        format.json { render action: 'show', status: :created, location: @name_card }
      else
        format.html { render action: 'new' }
        format.json { render json: @name_card.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @name_card.update(name_card_params)
        redirect_to @name_card, notice: 'Name_card was successfully updated.'
      else
        render action: 'edit'
      end
    end
  end

  def destroy
    @name_card.destroy
   respond_to do |format|
       format.html { redirect_to name_card_url }
       format.json { head :no_content }
     end
  end

  private
  def set_name_card
    @name_card = NameCard.find(params[:id])
  end

  def name_card_params
    params.require(:name_card).permit(:name, :address)
  end
end
