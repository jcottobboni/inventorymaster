module Inventorymaster
  class ReportsController < ApplicationController

    def index
    @locations = Location.all
    @areas = Area.all
    @manufacturers = Manufacturer.all

    end

    def current_stock_list
       if params[:location].blank? and params[:area].blank? and params[:manufacturer].blank?
        @products = Product.all
      elsif params[:location].blank? and params[:area].blank?
        @products = Product.where(:manufacturer_id=>params[:manufacturer])
      elsif params[:location].blank? and params[:manufacturer].blank?
        @products = Product.where(:area_id=>params[:area])
      elsif params[:area].blank? and params[:manufacturer].blank?
        @products = Product.where(:location_id=>params[:location])
      else
        @products = Product.where(:location_id=>params[:location],:area_id=>params[:area],:manufacturer_id=>params[:manufacturer])
      end

        respond_to do |format|
            format.html
            format.pdf do
            @pdf = WickedPdf.new.pdf_from_string(
                  render_to_string('current_stock_list.pdf.erb'),
                  :encoding => "UTF-8",
                  :orientation => 'Landscape',
                  :footer => { :right => 'Pagina [page] de [topage]' }
                )
            send_data(@pdf, :filename => "relatorio_estoque_atual_para_a_data_#{DateTime.now.strftime('%d-%m-%Y_as_%H-%M')}.pdf",  :type=>"application/pdf")

          end
      end
    end


    def moviments_by_months
      @moviments = Transaction.all
      @moviments_months = @moviments.group_by { |t| t.date.beginning_of_month }
       respond_to do |format|
            format.html
            format.pdf do
            @pdf = WickedPdf.new.pdf_from_string(
                  render_to_string('moviments_by_months.pdf.erb'),
                  :encoding => "UTF-8",
                  :orientation => 'Landscape',
                  :footer => { :right => 'Pagina [page] de [topage]' }
                )
            send_data(@pdf, :filename => "relatorio_movimentacoes_por_meses_gerado_em#{DateTime.now.strftime('%d-%m-%Y_as_%H-%M')}.pdf",  :type=>"application/pdf")

          end
      end
    end

      def low_stock_list
        if params[:location].blank? and params[:area].blank? and params[:manufacturer].blank?
        @products = Product.where(' ammount <= minimum_stock_count')
      elsif params[:location].blank? and params[:area].blank?
        @products = Product.where(' ammount <= minimum_stock_count and manufacturer_id=?',params[:manufacturer])
      elsif params[:location].blank? and params[:manufacturer].blank?
        @products = Product.where(:area_id=>params[:area])
        @products = Product.where(' ammount <= minimum_stock_count and area_id=?',params[:area])
      elsif params[:area].blank? and params[:manufacturer].blank?
        @products = Product.where(:location_id=>params[:location])
        @products = Product.where(' ammount <= minimum_stock_count and location_id=?',params[:location])
      else
        @products = Product.where(:location_id=>params[:location],:area_id=>params[:area],:manufacturer_id=>params[:manufacturer])
        @products = Product.where(' ammount <= minimum_stock_count and location_id=? and area_id=? and manufacturer_id=?',params[:location],params[:area],params[:manufacturer])
      end

       respond_to do |format|
            format.html
            format.pdf do
            @pdf = WickedPdf.new.pdf_from_string(
                  render_to_string('low_stock_list.pdf.erb'),
                  :encoding => "UTF-8",
                  :orientation => 'Landscape',
                  :footer => { :right => 'Pagina [page] de [topage]' }
                )
            send_data(@pdf, :filename => "Items_estoque_baixo_gerado_em#{DateTime.now.strftime('%d-%m-%Y_as_%H-%M')}.pdf",  :type=>"application/pdf")

          end
      end
    end


def out_stock_list
        if params[:location].blank? and params[:area].blank? and params[:manufacturer].blank?
        @products = Product.where(' ammount = 0')
      elsif params[:location].blank? and params[:area].blank?
        @products = Product.where(' ammount = 0 and manufacturer_id=?',params[:manufacturer])
      elsif params[:location].blank? and params[:manufacturer].blank?
        @products = Product.where(:area_id=>params[:area])
        @products = Product.where(' ammount = 0 and area_id=?',params[:area])
      elsif params[:area].blank? and params[:manufacturer].blank?
        @products = Product.where(:location_id=>params[:location])
        @products = Product.where(' ammount = 0 and location_id=?',params[:location])
      else
        @products = Product.where(:location_id=>params[:location],:area_id=>params[:area],:manufacturer_id=>params[:manufacturer])
        @products = Product.where(' ammount = 0 and location_id=? and area_id=? and manufacturer_id=?',params[:location],params[:area],params[:manufacturer])
      end

       respond_to do |format|
            format.html
            format.pdf do
            @pdf = WickedPdf.new.pdf_from_string(
                  render_to_string('low_stock_list.pdf.erb'),
                  :encoding => "UTF-8",
                  :orientation => 'Landscape',
                  :footer => { :right => 'Pagina [page] de [topage]' }
                )
            send_data(@pdf, :filename => "relatorio_items_estoque_zerado_gerado_em#{DateTime.now.strftime('%d-%m-%Y_as_%H-%M')}.pdf",  :type=>"application/pdf")

          end
      end
    end


  end
end