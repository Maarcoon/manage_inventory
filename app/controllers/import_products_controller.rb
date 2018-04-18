require 'roo'

class ImportProductsController < ApplicationController
  # GET /import_products/new
  def new
  end

  # POST /import_products
  # POST /import_products.json
  def create

    spreadsheet = Roo::Excel.new(params[:file].path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      # row['Ref. Principal'] / row['Código'] / row['Descrição']
      Product.create(code: row['Ref. Principal'], name: row['Descrição']) unless Product.find_by(code: row['Ref. Principal'])
    end

    redirect_to products_path, notice: 'Produtos importados.'
  end
end
