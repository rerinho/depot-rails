class StoreController < ApplicationController
  include StoreIndexCounter
  include CurrentCart
  
  before_action :set_counter, :set_cart, only: [:index]

  def index
    @access_counter = session[:counter]
    @products = Product.order(:title)
  end
end
