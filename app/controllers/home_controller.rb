class HomeController < ApplicationController
  def index
    if session[:cart].nil? 
        session[:cart] = [] 
    end
    @cart = session[:cart]
  end
end
