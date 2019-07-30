module Api
  module V1
    class KindsController < ApplicationController

      def index
        kinds = Kind.order('created_at DESC')
        render json: { data: kinds }
      end

      def show
        kind = Kind.find(params[:id])
        render json: { data: kind }
      end

      def create
				kind = Kind.new(kind_params)
				if kind.save
					render json: { status: 'SUCCESS', message:'Saved article', data:kind },status: :ok
				else
					render json: { status: 'ERROR', message:'Articles not saved', data:kind.erros },status: :unprocessable_entity
				end
      end

      def update
				kind = Kind.find(params[:id])
				if kind.update_attributes(kind_params)
					render json: { status: 'SUCCESS', message:'Updated kind', data:kind },status: :ok
				else
					render json: { status: 'ERROR', message:'kind not update', data:article.erros },status: :unprocessable_entity
				end
			end

      def destroy
        kind = Kind.find(params[:id])
        kind.destroy
        render json: { status: 'SUCCESS', message: 'Destroyed', data: kind }, status: :ok
      end
      

      private
        def kind_params
          params.permit(:name, :description)
        end

    end
  end
end