class SaleService < ApplicationService
  attr_reader :sale, :params

  def initialize(params={}, id=nil)
    @sale = Sale.new(params[:id]) if id
    @params = params
  end

  def call
    valid_sale
  end


  private
  def valid_sale
    if @sale && valid_state?
      return @params if @sale.product_items.select {|item| item > 0 }
      raise 'Dados inválidos'
    end
    return @params if valid_state?
  end

  def valid_state?
    return true if @params[:client_id] && @params[:user_id]
  end

end