class InventoryItemsController < ApplicationController
  def update
    @inventory_item = InventoryItem.find(params[:id])

    InventoryItemService.new(@inventory_item, params[:status]).move

    redirect_to @inventory_item.inventory
  end
end
