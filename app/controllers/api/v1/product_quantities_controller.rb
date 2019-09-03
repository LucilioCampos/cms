module Api
  module V1
    class ProductQuantities < BaseController

      def index
        quantities = ProductQuantity.order(id: :desc)
        if quantities
          render json: quantities, status: 200
        else
          render json: quantities.errors, status: :unprocessable_entity
        end
      end

      def show
        quantity = ProductQuantity.find(params[:id])
        if quantity
          render json: quantity, status: 200
        else
          render json: quantity.errors, status: :unprocessable_entity
        end
      end

      def create
        quantity = ProductQuantity.create(product_quantity_params)
        if quantity.save
          render json: quantity, status: 201
        else
          render json: quantity.errors, status: :unprocessable_entity
        end
      end

      def update
        quantity = ProductQuantity.find(params[:id])
        if quantity.update_attributes(product_quantity_params)
          render json: quantity, status: 202
        else
          render json: quantity.errors, status: :unprocessable_entity
        end
      end

      def destroy
        quantity = ProductQuantity.find(params[:id])
        if quantity.destroy
          render json: quantity, status: 204
        else
          render json: quantity.errors, status: :unprocessable_entity
        end
      end

      private
      def product_quantity_params
        params.permit(:product_id, :quantity)
      end

    end
  end
end