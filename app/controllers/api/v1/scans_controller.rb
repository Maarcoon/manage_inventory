module Api
  module V1
    class ScansController < ApplicationController
      skip_before_action :verify_authenticity_token
      def create
        begin
          if params[:tipo] == 'entrada'
            # Create product units based on product selected in app and rfids readed
            if product = Product.find_by_id(params[:produto])
              params[:rfids].each do |rfid|
                product.product_units.create(rfid: rfid)
              end
            else
              return render json: {status: 'error', message: "Produto com id #{params[:produto]} não encontrado."}
            end
          elsif params[:tipo] == 'saida'
            # Update product unit status to sold based on rfid read
            if params[:rfids].is_a? Array
              params[:rfids].each do |rfid|
                product_unit = ProductUnit.find_by_rfid(rfid)
                product_unit.sold! if product_unit
              end
            else
              return render json: {status: 'error', message: "O parametro rfids deve ser uma lista de rfids."}
            end
          elsif params[:tipo] == 'inventario'
            # Receives an array of RFIDS and update inventory items in case of item found
            if params[:rfids].is_a? Array
              inventory = Inventory.open
              params[:rfids].each do |rfid|
                inventory_item = InventoryItem.joins(:product_unit).where(product_units: { rfid: rfid }).first
                inventory_item.found! if inventory_item
              end
            else
              return render json: {status: 'error', message: "O parametro rfids deve ser uma lista de rfids."}
            end
          else
            render nothing: true, status: :bad_request
          end
          render json: {status: 'success'}
        rescue
          render nothing: true, status: :bad_request
        end
      end
    end
  end
end