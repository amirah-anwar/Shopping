class Product < ActiveRecord::Base
  attr_accessible :description, :price, :title

  belongs_to :user
  has_many :reviews

  attr_accessible :attachment
  has_attached_file :attachment,
                    styles: { medium: "300x300",
                              thumb: "100x100" },
                    default_url: "/images/missing.png"

  validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\Z/
end
