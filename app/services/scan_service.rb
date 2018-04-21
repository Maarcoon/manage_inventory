class ScanService
  def initialize(params)
    @rfids = params[:rfids]
    @product = Product.find_by_id(params[:produto])
  end

  # Create product units based on product selected in app and rfids readed
  def entrada
    @rfids.each do |rfid|
      @product.product_units.create(rfid: rfid)
    end
  end

  # Update product unit status to sold based on rfid read
  def saida
    @rfids.each do |rfid|
      product_unit = ProductUnit.find_by_rfid(rfid)
      product_unit.sold! if product_unit
    end
  end

  # Receives an array of RFIDS and update inventory items in case of item found
  def inventario
    @rfids.each do |rfid|
      inventory_item = Inventory.find_by(open: true).inventory_items.joins(:product_unit).where(product_units: { rfid: rfid }).first
      inventory_item.found! if inventory_item
    end
  end
end
