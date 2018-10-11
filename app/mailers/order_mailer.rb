class OrderMailer < ApplicationMailer
  def order_receipt(order)
    @order = order
    mail(to: @order.email, subject: 'Your Jungle order')
  end
end
