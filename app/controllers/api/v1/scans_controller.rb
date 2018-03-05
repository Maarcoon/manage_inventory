module Api
  module V1
    class ScansController < ApplicationController
      skip_before_action :verify_authenticity_token
      def create
        begin
          if params[:tipo] == 'entrada'
            product = Product.find(params[:produto])
            params[:rfids].each do |rfid|
              product.product_unit.create(rfid: rfid)
            end
          elsif params[:tipo] == 'saida'
            #TODO
          elsif params[:tipo] == 'inventario'
            #TODO
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