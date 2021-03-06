class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  def total_price
    product.price * quantity
  end
end
 # if a table has foreign keys, the corresponding model 
 # should have a belongs_to for each