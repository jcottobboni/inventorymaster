require_dependency "inventorymaster/application_controller"

module Inventorymaster
  class TransactionTypesController < ApplicationController
    before_action :set_transaction_type, only: [:show, :edit, :update, :destroy]

    # GET /transaction_types
    def index
      @transaction_types = TransactionType.all
    end

    # GET /transaction_types/1
    def show
    end

    # GET /transaction_types/new
    def new
      @transaction_type = TransactionType.new
    end

    # GET /transaction_types/1/edit
    def edit
    end

    # POST /transaction_types
    def create
      @transaction_type = TransactionType.new(transaction_type_params)

      if @transaction_type.save
        redirect_to @transaction_type, notice: 'Transaction type was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /transaction_types/1
    def update
      if @transaction_type.update(transaction_type_params)
        redirect_to @transaction_type, notice: 'Transaction type was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /transaction_types/1
    def destroy
      @transaction_type.destroy
      redirect_to transaction_types_url, notice: 'Transaction type was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_transaction_type
        @transaction_type = TransactionType.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def transaction_type_params
        params.require(:transaction_type).permit(:name)
      end
  end
end
