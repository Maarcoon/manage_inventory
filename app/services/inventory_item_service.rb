class InventoryItemService
  def initialize(item, status)
    @item = item
    @status = status
  end

  def move
    @item.product_unit.update_attributes(status: @status)
    if @status == 'lost'
      @item.update_attributes(status: :missing)
    else
      @item.update_attributes(status: :found)
    end
  end
end
