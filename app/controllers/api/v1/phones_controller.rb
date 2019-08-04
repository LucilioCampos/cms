module Api
  module V1
    class PhonesController < ApplicationController

      def index
        @phones = Phone.all
        render json: @phones, status: 200
      end

      def show
        @phone = Phone.find(params[:id])
        render json: @phone, status: 200
      end

      def new
        @phone = Phone.new(phone_params)
      end

      def update
        @phone = Phone.find(params[:id])
        if @phone.update_attributes(phone_params)
          render json: { status: 'SUCCESS', message:'Telefone Atualizado', telefone: @phone }, status: 202
				else
					render json: { status: 'ERROR', message:'Telefone não atualizado', telefone: @phone.erros },status: :unprocessable_entity
        end
      end

      def destroy
        @phone = Phone.find(params[:id])
        @phone.destroy
        render json: { status: 'SUCCESS', message: 'Telefone excluído com sucesso!', telefone: @phone}
      end


      private

      def phone_params
        params.permit(:kind, :num)
      end

    end
  end
end