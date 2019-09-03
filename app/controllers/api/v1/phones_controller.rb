module Api
  module V1
    class PhonesController < BaseController

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

      def create
        phone = Phone.create(phone_params)
        if phone.save
          render json: phone, status: 201
        else
          render json: phone.errors, status: :unprocessable_entity
        end
      end

      def update
        phone = Phone.find(params[:id])
        if phone.update_attributes(phone_params)
          render json: phone, status: 202
				else
					render json: phone.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @phone = Phone.find(params[:id])
        @phone.destroy
        render json: @phone, status: 204
      end


      private

        def phone_params
          params.permit(:kind, :num, :user_id, :client_id)
        end

    end
  end
end