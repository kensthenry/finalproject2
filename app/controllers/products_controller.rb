class ProductsController < ApplicationController
  before_action :initialize_session

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @Product = Product.new(product_params)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def cart
    @cart = session[:cart]
        .filter{|id,count| count>0} 
        .map{|id,count| [Product.find(id),count]} 
  end

  def checkout
    session[:cart] = nil 
    redirect_to products_path
  end

  def buy
    @product = Product.find(params[:id])
    @product.stock = @product.stock=1
    if @product.stock < 0
        redirect_to product_path
    else
        @product.save
        curr_q = session[:cart][@product.id.to_s].to_i
        curr_q += 1
        session[:cart][@product.id.to_s]=curr_q
        redirect_to product_path
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to products_path, status: :see_other
  end

  def json
    @products = Product.all
    render json: @products, only: [:id, :title, :description, :price]
  end

  private
    def product_params
      params.require(:product).permit(:title, :body)
    end

  def initialize_session
  empty_cart = Product.all.map{|p| [p.id, 0]}.to_h 
  session[:cart] ||= empty_cart 
  @item_count = session[:cart].values.reduce(:+) 
  end
end
