class Product < ActiveRecord::Base
  attr_accessible :description, :name, :pricing, :category_id
  has_many :categories
  validates :description, :name, :pricing, presence: true
  validates :pricing, numericality: { only_float: true }

end
