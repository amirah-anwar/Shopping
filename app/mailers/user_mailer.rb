class UserMailer < ActionMailer::Base
  default from: 'notifications@example.com'

  def transaction_confirmation(user, order, products)
    @user = user
    @ordered_products = products
    @order = order
    mail(to: @user.email, subject: 'Transaction Confirmation')
  end
end
