require_dependency "inventorymaster/application_controller"

module Inventorymaster
  class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy]
    #autocomplete Inventorymaster::Product, :name
    # GET /products
    #def index
      #@products = Product.all.page(params[:page]).order(:name)
     # @product = Product.new
   # end

  def index
    @locations = Location.all
    @areas = Area.all
    @manufacturers = Manufacturer.all
    if params[:query].present?
      @products = Product.search(params[:query], page: params[:page])
    else
      @products = Product.all.page params[:page]
    end
  end

    # GET /products/1
    def show
      respond_to do |format|
        format.html
        format.pdf do
        @pdf = WickedPdf.new.pdf_from_string(
              render_to_string('show.pdf.erb'),
              :encoding => "UTF-8",
              :orientation => 'Landscape',
              :footer => { :right => 'Pagina [page] de [topage]' }
            )
        send_data(@pdf, :filename => "relatorio_detalhado_#{@product.name}_para_a_data_#{DateTime.now.strftime('%d-%m-%Y_as_%H-%M')}.pdf",  :type=>"application/pdf")

      end
      end
    end

    # GET /products/new
    def new
      @product = Product.new
      @products = Product.all
      @locations = Location.all
      @transactiontypes = TransactionType.all
      #@product.transaction.build
       @manufactures= Manufacturer.all
      @areas = Area.all

    end

    # GET /products/1/edit
    def edit
       @products = Product.all
      @locations = Location.all
      @transactiontypes = TransactionType.all
      #@product.transaction.build
       @manufactures= Manufacturer.all
      @areas = Area.all
    end

    # POST /products
    def create
      @product = Product.new(product_params)
       @products = Product.all
      @locations = Location.all
      @transactiontypes = TransactionType.all
      #@product.transaction.build
       @manufactures= Manufacturer.all
      @areas = Area.all
      @product.ammount = 0

      if @product.save
        redirect_to @product, notice: 'Product was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /products/1
    def update
      if @product.update(product_params)
        redirect_to @product, notice: 'Product was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /products/1
    def destroy
      @product.destroy
      redirect_to products_url, notice: 'Product was successfully destroyed.'
    end

    def autocomplete
      render json: Product.search(params[:query], autocomplete: true, limit: 10).map(&:name)
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_product
        @product = Product.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def product_params
        params.require(:product).permit(:name, :sku, :upc, :summary, :labels, :area_id,:location_id ,:manufacturer_id, :minimum_stock_count,:transactions_attributes=>[:id,:kind, :date, :location_id, :user_id, :upc, :unit_cost, :unit_sale, :ammount, :average_cost, :reason, :comment, :serial_number, :transaction_type_id,:product_id])
      end
  end
end
