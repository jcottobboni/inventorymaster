require_dependency "inventorymaster/application_controller"

module Inventorymaster
  class TransactionsController < ApplicationController
    before_action :set_transaction, only: [:show, :edit, :update, :destroy]

    # GET /transactions
    def index
      @transactions = Transaction.all
    end

    # GET /transactions/1
    def show
    end

    # GET /transactions/new
    def new
      @transaction = Transaction.new
      @products = Product.all
      @locations = Location.all
      @transactiontypes = TransactionType.all
      @transaction.product_id = params[:product_id]
      @transaction.kind = params[:kind]
    end

    # GET /transactions/1/edit
    def edit
       @products = Product.all
      @locations = Location.all
      @transactiontypes = TransactionType.all
    end

    # POST /transactions
    def create
      @transaction = Transaction.new(transaction_params)
      @product = Product.find(@transaction.product_id)

      if @transaction.kind =="Entrada" && @product.ammount!= nil
        @product.ammount += @transaction.ammount
      elsif @transaction.kind == "Saida" && @product.ammount!= nil
        @product.ammount -= @transaction.ammount
      elsif @transaction.kind =="Entrada" && @product.ammount == nil
        @product.ammount = @transaction.ammount
      elsif @transaction.kind == "Saida" && @product.ammount== nil
        #@product.ammount =0
        @product.ammount - @transaction.ammount
      else
      end

      if @transaction.save && @product.save
        redirect_to @product, notice: 'Transaction was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /transactions/1
    def update
       @products = Product.all
      @locations = Location.all
      @transactiontypes = TransactionType.all
      if @transaction.update(transaction_params)
        redirect_to @transaction, notice: 'Transaction was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /transactions/1
    def destroy
      @transaction.destroy
      redirect_to transactions_url, notice: 'Transaction was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_transaction
        @transaction = Transaction.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def transaction_params
        params.require(:transaction).permit(:kind, :date, :location_id, :user_id, :upc, :unit_cost, :unit_sale, :ammount, :average_cost, :reason, :comment, :serial_number, :transaction_type_id,:product_id)
      end
  end
end
