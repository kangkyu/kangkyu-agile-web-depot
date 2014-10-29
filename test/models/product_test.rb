require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "product price must be positive" do
    product = Product.new(
                title: "Etsy, Inc.",
                description: 'Etsy is an e-commerce website',
                image_url: 'default.jpg'
              )
    product.price = -1
    assert product.invalid?
    assert_equal product.errors[:price], ["must be greater than or equal to 0.01"]

    product.price = 0
    assert product.invalid?
    assert_equal product.errors[:price], ["must be greater than or equal to 0.01"]

    product.price = 1
    assert product.valid?
  end

  def new_product(image_url)
    Product.new(title: "Etsy, Inc.",
                description: 'Etsy is an e-commerce website',
                price: 270.25,
                image_url: image_url)
  end

  test "image url" do
    ok = %w{ dave.jpg dave.png dave.gif dave.JPG DAVE.Jpg 
             http://no.such.site/a/b/c/dave.gif }
    bad = %w{ dave.doc dave.gif/more dave.gif.fred }
    ok.each do |name|
      assert new_product(name).valid?, "#{name} should be valid"
    end
    bad.each do |name|
      assert new_product(name).invalid?, "#{name} shouldn't be valid"
    end
  end

  test "product title must be unique" do
    product = Product.new(title: products(:ruby).title,
                description: 'Etsy is an e-commerce website',
                price: 270.25,
                image_url: "image_url.gif")
    assert product.invalid?
    assert_equal product.errors[:title], ["has already been taken"]
  end
end
