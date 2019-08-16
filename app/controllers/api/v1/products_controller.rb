module Api
  module V1
    class ProductsController < ApplicationController

      def index
        products = Product.order('created_at DESC')
        render json: products, status: 200
      end

      def show
        product = Product.find(params[:id])
        if product
          render json: product, status: 200
        else
          render json: {message: 'Nenhum produto encontrado'}, status: 404
        end
      end

      def create
        product = ProductCreate.new(product_params).call
        render json: product, status: 201 if product.save
      end

      def creatase
        product = Product.create(product_params)
        if product.save
          render json: product, status: 201
        else
          render json: { message: 'Não foi possível criar o produto' }, status: 404
        end
      end

      def update
        product = Product.find(params[:id])
        if product.update_attributes(product_params)
          render json: product, status: 202
        else
          render json: { message: 'Não foi atualizar criar o produto' }, status: 404
        end
      end

      def destroy
        product = Product.find(params[:id])
        if product.destroy
          render json: { message: 'Produto excluído com sucesso!' }, status: 204
        else
          render json: { message: 'Não foi possível excluír o produto' }, status: 404
        end
      end


      private
      def product_params
        params.permit(:kind_id, :description, :status, :price)
      end
    end
  end
end