class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def create
    unless current_user
      flash[:danger] = "You must add order information."
      redirect_to user_info_path
      return
    end
    charge = perform_stripe_charge
    order  = create_order

    if order.valid?
      empty_cart!
      redirect_to order, notice: 'Your Order has been placed.'
    else
      redirect_to cart_path, error: order.errors.full_messages.first
    end

  rescue Stripe::CardError => e
    redirect_to cart_path, error: e.message
  end

  def user_info
    @cart_total =0
    cart.each do |product_id, details|
      if product = Product.find_by(id: product_id)
        quantity = details['quantity'].to_i
        @cart_total =  @cart_total + (product.price * quantity)
      end
    end
  end

  private

  def empty_cart!
    update_cart({})
  end

  def perform_stripe_charge
    Stripe::Charge.create(
      source:      params[:stripeToken],
      amount:      5000,
      description: "Trendz Order",
      currency:    'usd'
    )
  end

  def create_order()
    order = Order.new(customer_id: current_user&.id, total_amount: cart_total, payment_method: 0, status: 0)
    cart.each do |product_id, details|
      if product = Product.find_by(id: product_id)
        quantity = details['quantity'].to_i
        order.order_items.new(
          product: product,
          quantity: quantity,
          price: product.price,
          total_price: product.price * quantity
        )
      end
    end
    order.save!
    order
  end

  def cart_total
    total = 0
    cart.each do |product_id, details|
      if p = Product.find_by(id: product_id)
        total += p.price * details['quantity'].to_i
      end
    end
    total
  end

end
