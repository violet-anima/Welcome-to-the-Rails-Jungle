class UserMailer < ApplicationMailer
  default from: 'no-reply@example.com'

  def order_confirmation_email(order)
    @order = order
    mail(to: @order.email, subject: "Order Confirmation: Order ID #{@order.id}")
  end
end