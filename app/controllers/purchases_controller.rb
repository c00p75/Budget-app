class PurchasesController < ApplicationController
  before_action :set_purchase, only: %i[show edit update destroy]

  # GET /purchases or /purchases.json
  def index
    @purchases = Purchase.all
  end

  # GET /purchases/new
  def new
    @categories = Category.all
    @purchase = Purchase.new
    return unless params[:category_id]

    @category = Category.find(params[:category_id])
  end

  # GET /purchases/1/edit
  def edit; end

  # POST /purchases
  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.author = current_user
    @category = Category.find(params[:purchase][:category_id])
    @category.purchases << @purchase

    if @purchase.save
      redirect_to category_url(params[:purchase][:category_id]), notice: 'Transaction was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /purchases/1 or /purchases/1.json
  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to purchase_url(@purchase), notice: 'Purchase was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1 or /purchases/1.json
  def destroy
    @purchase.destroy

    respond_to do |format|
      format.html { redirect_to purchases_url, notice: 'Purchase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_purchase
    @purchase = Purchase.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def purchase_params
    params.require(:purchase).permit(:name, :amount)
  end
end
