module StoreIndexCounter
  private
    def set_counter
      if session[:counter].nil?
        session[:counter] = 1
      else
        session[:counter] +=  1
      end 
    end

    def redefine_counter
      session[:counter] = 0
    end
end