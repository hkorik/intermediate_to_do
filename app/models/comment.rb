class Comment < ActiveRecord::Base
  belongs_to :product
  attr_accessible :author, :content, :product_id

  validates :author, :content, presence: true
  validates :content, length: { minimum: 10 }
end
