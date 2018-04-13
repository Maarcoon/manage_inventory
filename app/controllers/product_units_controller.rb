class ProductUnitsController < ApplicationController
  before_action :set_product_unit, only: [:destroy]

  # DELETE /product_units/1
  # DELETE /product_units/1.json
  def destroy
    @product_unit.destroy
    respond_to do |format|
      format.html { redirect_to @product_unit.product, notice: 'Product unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_unit
      @product_unit = ProductUnit.find(params[:id])
    end
end
