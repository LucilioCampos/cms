module Api
  module V1
    class DiscountsController < BaseController

      def index
        discounts = Discount.order(created_at: :desc)
        if discounts
          render json: discounts, status: 200
        else
          render json: discounts.errors, status: 404
        end
      end

      def show
        discount = Discount.find(params[:id])
        if discount
          render json: discount, status: 200
        else
          render json: discount.errors, status: :unprocessable_entity
        end
      end

      def create
        discount = Discount.create(discount_params)
        if discount.save
          render json: discount, status: 201
        else
          render json: discount.errors, status: 404
        end
      end

      def update
        discount = Discount.find(params[:id])
        if discount.update_attributes(discount_params)
          render json: discount, status: 202
        else
          render json: discount.errors, status:404
        end
      end

      def destroy
        discount = Discount.find(params[:id])
        if discount.destroy
          render json: discount, status: 204
        else
          render json: discount.erros, status: 404
        end
      end

      private
      def discount_params
        params.permit(
          :name, :description, :kind, :status, :value, :discount_id
        )
      end
    end
  end
end