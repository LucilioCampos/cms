module Api
  module V1
    class KindsController < ApplicationController

      def index
        @kinds = Kind.order('created_at DESC')
        render json: @kinds, status: 200
      end

      def show
        kind = Kind.find(params[:id])
        render json: kind
      end

      def create
				kind = Kind.new(kind_params)
				if kind.save
					render json: { status: 'SUCCESS', message:'Tipo salvo', tipo: kind }, status: :ok
				else
					render json: { status: 'ERROR', message:'Tipo não salvo', tipo: kind.erros }, status: :unprocessable_entity
				end
      end

      def update
				kind = Kind.find(params[:id])
				if kind.update_attributes(kind_params)
					render json: kind, status: 201
				else
					render json: { status: 'ERROR', message:'kind not update', tipo: kind.erros }, status: :unprocessable_entity
				end
			end

      def destroy
        kind = Kind.find(params[:id])
        kind.destroy
        render json: { status: 'SUCCESS', message: 'Destroyed', tipo: kind }, status: :ok
      end
      

      private
        def kind_params
          params.permit(:name, :description)
        end

    end
  end
end