module Api
  module V1
    class KindsController < ApplicationController

      def index
        @kinds = Kind.order('created_at DESC')
        render json: @kinds, status: 200
      end

      def show
        kind = Kind.find(params[:id])
        if kind.valid?
          render json: kind
        else
          render json: { status: 404 }
        end
      end

      def new
        @kind = Kind.new
      end

      def create
        @kind = Kind.create(kind_params)
        puts kind_params
				if @kind.save
					render json: @kind, status: 201
				else
					render json: @kind.errors, status: :unprocessable_entity
				end
      end

      def update
				kind = Kind.find(params[:id])
				if kind.update_attributes(kind_params)
					render json: kind, status: 201
				else
					render json: { status: 'ERROR', message:'kind not update', tipo: kind.errors }, status: :unprocessable_entity
				end
			end

      def destroy
        @kind = Kind.find(params[:id])
        @kind.destroy
        render json: @kind, status: 204
      end
      

      private
        def kind_params
          params.permit(:name, :description)
        end

    end
  end
end