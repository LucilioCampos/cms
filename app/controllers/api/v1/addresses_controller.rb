module Api
  module V1
    class AddressesController < ApplicationController
      before_action :authenticate_user!

      def index
        addresses = Address.order('created_at DESC')
        if addresses.any?
          render json: addresses, status: 200
        else
          render json: { status: 'Nenhum usuário cadastrado' }, status: 404
        end
      end

      def show
        address = Address.find(params[:id])
        if address.present?
          render json: address, status: 200
        else
          render json: { status: "Nenhum endereço encontrado com o id #{params[:id]}" }, status: 404
        end
      end

      def create
        address = Address.create(address_params)
        if address.save
          render json: address, status: 201
        else
          render json: { status: address.errors }, status: :unprocessable_entity
        end
      end

      def update
        address = Address.find(params[:id])
        if address.update_attributes(address_params)
          render json: address, status: 202
        else
          render json: { status: address.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        address = Address.find(params[:id])
        if address.destroy
          render json: address, status: 204
        else
          render json: address.errors, status: :unprocessable_entity
        end
      end


      private

        def address_params
          params.permit(:state, :city, :neighborhood, :street, :cep, :notes, :client_id, :user_id)
        end
    end
  end
end