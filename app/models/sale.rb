class Sale < ApplicationRecord
  belongs_to :client
  belongs_to :user
  has_many :product_items
  has_one :sale_product

  validates_presence_of :client, :user, :product_items

  accepts_nested_attributes_for :product_items

  before_create :initial_product_status, :sale_products_create

  before_update :final_product_status, :sale_products_update

  private

  def initial_product_status
    self.product_items.map {|item| item.status = :pending}
  end

  def final_product_status
    if self.sale_product && self.sale_product.status == :payed
      self.product_items.map { |item| item.status = :payed }
    end
  end

  def sale_products_create
    if self.sale_product.nil?
      self.sale_product = SaleProduct.create(sale_id: self)
    end
  end

  def sale_products_update
    self.sale_product.save
  end

end
