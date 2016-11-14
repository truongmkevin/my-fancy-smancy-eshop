class CartController < ApplicationController

  before_action :authenticate_user!, only: [:checkout]

  LOCAL_SALES_TAX = 0.0925

  def view_cart
    @line_items = LineItem.all
  end

  def checkout

    @line_items = LineItem.all
    @order = Order.new
    @order.user_id = current_user.id
    sum = 0

    @line_items.each do |line_item|
      sum += line_item.total

      # @order.order_items[line_item.product_id] = line_item.quantity

      line_item.product.quantity -= line_item.quantity
      line_item.product.save
    end

    @order.subtotal = sum
    @order.sales_tax = sum * LOCAL_SALES_TAX
    @order.grand_total = @order.subtotal + @order.sales_tax
    @order.save

    LineItem.destroy_all
  end

  def add_to_cart
    line_item = LineItem.new
    line_item.product_id = params[:product_id]
    line_item.quantity = params[:quantity]
    product = Product.find(params[:product_id])

    line_item.total = product.price * line_item.quantity
    line_item.save

    redirect_to view_cart_path
  end
end
