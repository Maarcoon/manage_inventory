class ProductUnitsController < ApplicationController
  before_action :set_product_unit, only: [:show, :edit, :update, :destroy]

  # GET /product_units
  # GET /product_units.json
  def index
    @product_units = ProductUnit.all
  end

  # GET /product_units/1
  # GET /product_units/1.json
  def show
  end

  # GET /product_units/new
  def new
    @product_unit = ProductUnit.new
  end

  # GET /product_units/1/edit
  def edit
  end

  # POST /product_units
  # POST /product_units.json
  def create
    @product_unit = ProductUnit.new(product_unit_params)

    respond_to do |format|
      if @product_unit.save
        format.html { redirect_to @product_unit, notice: 'Product unit was successfully created.' }
        format.json { render :show, status: :created, location: @product_unit }
      else
        format.html { render :new }
        format.json { render json: @product_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_units/1
  # PATCH/PUT /product_units/1.json
  def update
    respond_to do |format|
      if @product_unit.update(product_unit_params)
        format.html { redirect_to @product_unit, notice: 'Product unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_unit }
      else
        format.html { render :edit }
        format.json { render json: @product_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_units/1
  # DELETE /product_units/1.json
  def destroy
    @product_unit.destroy
    respond_to do |format|
      format.html { redirect_to product_units_url, notice: 'Product unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_unit
      @product_unit = ProductUnit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_unit_params
      params.require(:product_unit).permit(:product_id, :rfid, :status)
    end
end
