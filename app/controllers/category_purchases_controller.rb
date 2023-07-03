class CategoryPurchasesController < ApplicationController
  before_action :set_category_purchase, only: %i[ show edit update destroy ]

  # GET /category_purchases or /category_purchases.json
  def index
    @category_purchases = CategoryPurchase.all
  end

  # GET /category_purchases/1 or /category_purchases/1.json
  def show
  end

  # GET /category_purchases/new
  def new
    @category_purchase = CategoryPurchase.new
  end

  # GET /category_purchases/1/edit
  def edit
  end

  # POST /category_purchases or /category_purchases.json
  def create
    @category_purchase = CategoryPurchase.new(category_purchase_params)

    respond_to do |format|
      if @category_purchase.save
        format.html { redirect_to category_purchase_url(@category_purchase), notice: "Category purchase was successfully created." }
        format.json { render :show, status: :created, location: @category_purchase }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category_purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /category_purchases/1 or /category_purchases/1.json
  def update
    respond_to do |format|
      if @category_purchase.update(category_purchase_params)
        format.html { redirect_to category_purchase_url(@category_purchase), notice: "Category purchase was successfully updated." }
        format.json { render :show, status: :ok, location: @category_purchase }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category_purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_purchases/1 or /category_purchases/1.json
  def destroy
    @category_purchase.destroy

    respond_to do |format|
      format.html { redirect_to category_purchases_url, notice: "Category purchase was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category_purchase
      @category_purchase = CategoryPurchase.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_purchase_params
      params.require(:category_purchase).permit(:category_id, :purchase_id)
    end
end
