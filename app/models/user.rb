class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  # A user can have many listings and if the user is deleted, so will be the listing
  has_many :listings, dependent: :destroy 
  # A user can be a seller
  has_many :sales, class_name: "Order", foreign_key: "seller_id"
  # Or a buyer
  has_many :purchases, class_name: "Order", foreign_key: "buyer_id"
end
