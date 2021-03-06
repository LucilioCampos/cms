module Api
  module V1
    class ClientsController < BaseController

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
          render json: @client, status: 202
        else
          render json: @client.errors, status: :unprocessable_entity
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

      def destroy
        @client = Client.find(params[:id])
        if @client.destroy
          render json: { message: 'Cliente successfully removed' }, status: 204
        else
          render json: @client.errors
        end
      end


      private

        def client_params
          params.permit(:name, :company, :email, :user_id, :notes, :status,
            phones_attributes: [:id, :kind, :num], 
            addresses_attributes: [:id, :state, :city, :neighborhood, :street, :notes],
            documents_attributes: [:id, :kind, :num, :user_id, :client_id]
          )
        end
      
    end
  end
end