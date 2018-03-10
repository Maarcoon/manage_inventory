class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show, :destroy]

  # GET /inventories
  # GET /inventories.json
  def index
    @inventories = Inventory.all
  end

  # GET /inventories/1
  # GET /inventories/1.json
  def show
  end

  # POST /inventories
  # POST /inventories.json
  def create
    @inventory = Inventory.new()

    if @inventory.save
      redirect_to @inventory, notice: 'Inventário iniciado com sucesso.'
    else
      redirect_to @inventory, notice: 'Não foi possível iniciar o inventário.'
    end
  end

  # DELETE /inventories/1
  # DELETE /inventories/1.json
  def destroy
    @inventory.update_attributes(closed_at: Time.now)
    redirect_to inventories_url, notice: 'O inventário foi fechado com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory
      @inventory = Inventory.find(params[:id])
    end
end
