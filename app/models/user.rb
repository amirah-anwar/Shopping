class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :remember_me, :fname, :lname, :postal, :avatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model

  has_attached_file :avatar, styles: { medium: "300x300>",
                                       thumb: "100x100>" },
                    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  has_many :products, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :orders, dependent: :destroy

  def name
    [self.fname, self.lname].join(' ')
  end
end
