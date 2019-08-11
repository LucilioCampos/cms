class ProductCreate < ApplicationService
  attr_reader :product

  def initialize(product)
    @product = product
  end

  def call
    new_product = Product.create(@product)
    new_product
  end
end