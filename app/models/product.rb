class Product < ActiveRecord::Base
  attr_accessible :description, :price, :title, :attachment, :user_id

  belongs_to :user
  has_many :reviews, dependent: :destroy

  accepts_nested_attributes_for :reviews

  has_attached_file :attachment,
                    styles: { medium: "300x300>",
                              thumb: "100x100>" },
                    default_url: "/images/missing.png"

  validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\Z/

  def is_owner?(current_user_id)
    self.user_id == current_user_id
  end
end
