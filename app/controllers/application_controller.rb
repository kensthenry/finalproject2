class ApplicationController < ActionController::Base
    before_action :initialize_session
    
    def clearsession
        session[:cart] = nil
        redirect_to listed_path
    end
    
    private
    def initialize_session
    empty_cart = Product.all.map{|p| [p.id, 0]}.to_h 
    session[:cart] ||= empty_cart 
    @item_count = session[:cart].values.reduce(:+) 
    end
end
