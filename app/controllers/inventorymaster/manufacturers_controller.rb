require_dependency "inventorymaster/application_controller"

module Inventorymaster
  class ManufacturersController < ApplicationController
    before_action :set_manufacturer, only: [:show, :edit, :update, :destroy]

    # GET /manufacturers
    def index
      @manufacturers = Manufacturer.all
    end

    # GET /manufacturers/1
    def show
    end

    # GET /manufacturers/new
    def new
      @manufacturer = Manufacturer.new
    end

    # GET /manufacturers/1/edit
    def edit
    end

    # POST /manufacturers
    def create
      @manufacturer = Manufacturer.new(manufacturer_params)

      if @manufacturer.save
        redirect_to @manufacturer, notice: 'Manufacturer was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /manufacturers/1
    def update
      if @manufacturer.update(manufacturer_params)
        redirect_to @manufacturer, notice: 'Manufacturer was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /manufacturers/1
    def destroy
      @manufacturer.destroy
      redirect_to manufacturers_url, notice: 'Manufacturer was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_manufacturer
        @manufacturer = Manufacturer.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def manufacturer_params
        params.require(:manufacturer).permit(:name, :cnpj)
      end
  end
end
