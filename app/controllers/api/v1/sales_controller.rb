module Api
  module V1
    class SalesController < ApplicationController

      def index
        sales = Sale.order(id: :desc)
        if sales
          render json: sales, status: 200
        else
          render json: sales.errors, status: 404
        end
      end

      def show
        sale = Sale.find(params[:id])
        if sale
          render json: sale, status: 200
        else
          render json: sale.errors, status: :unprocessable_entity
        end
      end

      def create
        new_sale = SaleService.new(sale_params, params[:id]).call
        sale = Sale.create(new_sale) if new_sale
        if sale.save
          render json: sale, status: 201
        else
          render json: sale.errors, status: :unprocessable_entity
        end
      end

      def update
        update = SaleService.new(sale_params, params[:id]).call
        sale = Sale.find(params[:id]) if update
        if sale.update_attributes(sale_params)
          render json: sale, status: 202
        else
          render json: "Dádos invalidos", status: :unprocessable_entity
        end
      end

      def destroy
        sale = Sale.find(params[:id])
        if salve.destroy
          render json: sale, status: 204
        else
          render json: sale.errors, status: :unprocessable_entity
        end
      end

      private
      def sale_params
        params.permit(
          :client_id, :user_id, :discount_id, :notes,
          product_items_attributes: [:id, :status, :total_price, :discount_id]
        )
      end
    end
  end 
end