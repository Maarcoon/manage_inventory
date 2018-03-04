module Api
  module V1
    class ProductsController < ApplicationController
      def index
        begin
          products = Product.all.order(:id)
          if params[:ID]
            products = products.where("id > ?", params[:ID])
          end
          render json: {status: 'success', products: products.select(:id, :code, :name)}
        rescue
          render nothing: true, status: :bad_request
        end
      end
    end
  end
end