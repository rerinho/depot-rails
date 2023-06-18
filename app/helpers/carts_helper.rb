module CartsHelper
  def checkout_button_disabled?
    content_for(:cart_checkout_button_disabled) || false
  end
end
