class Order < ActiveRecord::Base
  attr_accessible :discount

  belongs_to :user
  belongs_to :product
end
