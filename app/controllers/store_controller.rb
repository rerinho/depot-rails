class StoreController < ApplicationController
  include StoreIndexCounter
  
  before_action :set_counter, only: [:index]

  def index
    @access_counter = session[:counter]
    @products = Product.order(:title)
  end
end
