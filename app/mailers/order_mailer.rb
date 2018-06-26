class OrderMailer < ApplicationMailer
  default from: "Tuấn <tuanit041296@gmail.com>"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.received.subject
  #
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.shipped.subject
  #
  def shipped(order)
    @order = order
    mail to: order.email, subject: " Store Order Shipped"
  end

  def received(order)
    @order = order
    mail to: order.email, subject: " Store Order Confirmation"
  end
end
