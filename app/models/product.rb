class Product < ActiveRecord::Base
  attr_accessible :description, :name, :pricing, :category_id
  belongs_to :category
  has_many :comments
  validates :description, :name, :pricing, presence: true
  validates :pricing, numericality: { only_float: true }

end
