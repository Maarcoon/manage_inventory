require 'roo'

class ImportProductsController < ApplicationController
  # GET /import_products/new
  def new
  end

  # POST /import_products
  # POST /import_products.json
  def create
    spreadsheet = Roo::Excelx.new(params[:file].path)
    header = spreadsheet.row(32)
    (34..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      unless ( row['Código'].blank? || Product.find_by(code: row['Ref. Principal']) )
        Product.create(code: row['Código'], name: row['Produto']) unless Product.find_by(code: row['Ref. Principal'])
      end
    end

    redirect_to products_path, notice: 'Produtos importados.'
  end
end
