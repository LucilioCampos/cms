module Api
  module V1
    class SaleProductsController < BaseController

      def index
        sale_products = SaleProduct.order(id: :desc)
        if sale_products
          render json: sale_products, status: 200
        else
          render json: {message: "Nenhum resultado encontrado"}, status: 404
        end
      end

      def show
        sale_product = SaleProduct.find(params[:id])
        if sale_product
          render json: sale_product, status: 200
        else
          render json: { message: 'Nenhum resultado encontrado!' }, status: 404
        end
      end

      def create
        render json: { message: 'Não é possível criar uma venda nessa rota favor verificar documentação' }, status: 422
      end

      def update
        sale_product = SaleProduct.find(params[:id])
        if sale_product && sale_product.update_attributes(sale_products_params)
          render json: sale_product, status: 202
        else
          render json: { message: 'Dados inválidos, favor verificar a documentação' }, status: 422
        end
      end

      def destroy
        sale_product = SaleProduct.find(params[:id])
        if sale_product && sale_product.destroy
          render json: { message: 'Venda excluída com sucesso' }, status: 204
        else
          render json: { message: 'Não foi possível excluir a venda'}, status: 422
        end
      end

      private

      def sale_products_params
        params.permit(:sale_id, :status, :total_price)
      end

    end
  end
end