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
      @product = Product.new(product_params)
    end

    def edit
      @product = Product.find(params[:id])
    end

    def cart
      @cart = session[:cart]
    end

    def checkout
      session[:cart] = nil
      redirect_to listed_path
    end

    def buy
      @product = Product.find(params[:id])
    if @product.stock < 0
        redirect_to listed_path
    else
        @product.save
        session[:cart].append(@product)
        redirect_to listed_path
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

      redirect_to products_path
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
      if session[:cart].nil? 
        session[:cart] = [] 
    end
    @cart = session[:cart]
  end
end

