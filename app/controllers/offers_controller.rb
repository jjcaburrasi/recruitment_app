class OffersController < ApplicationController
  before_action :set_offer, only: %i[ show edit update destroy send_offer]
  before_action :logged_in_user, only: [:show, :index]
  before_action :admin_user, only: [ :new, :create, :edit, :destroy, :send_offer]

  # GET /offers or /offers.json
  def index
    @offers = Offer.all
  end

  # GET /offers/1 or /offers/1.json
  def show
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers or /offers.json
  def create
    @offer = Offer.new(offer_params)

    respond_to do |format|
      if @offer.save
        format.html { redirect_to offer_url(@offer), notice: "Offer was successfully created." }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  def send_offer
    @offer.status = :sent
    if @offer.update(offer_params)
      UserMailer.send_offer(@offer.user, @offer).deliver_now
      flash[:info] = "Offer was sended to the candidate."
      redirect_to offer_url(@offer)
    else
      redirect_to edit_offer_url(@offer)
    end
  end

  # PATCH/PUT /offers/1 or /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to offer_url(@offer), notice: "Offer was successfully updated." }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1 or /offers/1.json
  def destroy
    @offer.destroy

    respond_to do |format|
      format.html { redirect_to offers_url, notice: "Offer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def reject_offer
    @offer = Offer.find(params[:id])
    if @offer.status?(:sent)
      @offer.reject
      if @offer.save
        flash[:danger] = "You have rejected the offer."
        redirect_to offer_url(@offer)
      end
    else
      flash[:danger] = "You don't have an offer."
      redirect_to root_url
    end
  end

  def accept_offer
    @offer = Offer.find(params[:id])
    if @offer.status?(:sent)
      @offer.accept
      if @offer.save
        flash[:success] = "You have accepted the offer."
        redirect_to offer_url(@offer)
      end
    else
      flash[:danger] = "You don't have an offer."
      redirect_to root_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def offer_params
      params.require(:offer).permit(:content, :user_id, :job_id, :status)
    end
end
