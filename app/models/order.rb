class Order < ActiveRecord::Base
  INITIAL_STATUS = 'pending'
  FINAL_STATUS = 'complete'
  attr_accessible :discount, :product_id, :user_id
  before_create :set_order_status

  has_many :ordered_products, dependent: :destroy
  has_many :products, through: :ordered_products
  belongs_to :user

  scope :pending_status, -> { where(status: INITIAL_STATUS) }

  def total_price
    ordered_products = self.ordered_products
    price = 0
    ordered_products.each do |ordered_product|
      price += ordered_product.product.price
    end
    price
  end

  def discounted_price
    total_price * 0.9
  end

  def complete!
    self.status = FINAL_STATUS
    self.save
  end

  private
    def set_order_status
      self.status = INITIAL_STATUS
    end
end
