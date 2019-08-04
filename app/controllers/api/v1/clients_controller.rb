module Api
  module V1
    class ClientsController < ApplicationController

      def index
        @clients = Client.order('CREATED_AT DESC')
        render json: @clients, status: 200
      end

      def show
        @client = Client.find(params[:id])
        render json: @client, status: 200
      end

      def new
        @client = Client.new
        @client.phones.build
      end

      def update
        @client = Client.find(params[:id])
        if @client.update_attributes(client_params)
          render json: @client, status: 201
        else
          render @client.errors, status: :unprocessable_entity
        end
      end

      def create
        @client = Client.create(client_params)
        if @client.save
          render json: @client, status: 201
        else
          render json: @client.errors, status: :unprocessable_entity
        end
      end


      private

        def client_params
          params.permit(:name, :company, :email, :user_id, :notes, :status,
            phones_attributes: [:kind, :num]
          )
        end
      
    end
  end
end