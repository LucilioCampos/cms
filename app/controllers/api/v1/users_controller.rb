module Api
  module V1
    class UsersController < ApplicationController

      def index 
        @users = User.order('created_at DESC')
        @users = User.search_name(params[:search_name]) if params[:search_name].present?
        @users = User.campos(params[:campos]) if params[:campos].present?
        if params[:search_name] && params[:campos]
          @users = User.search_name(params[:search_name]).campos(params[:campos])
        end
        render json: @users, status: 200
      end

      def show
        user = User.find(params[:id])
        render json: user, status: 200
      end

      def new
        @user = User.new
        @user.phones.build
      end

      def create
        @user = User.create(user_params)
        if @user.save
          render json: { data: @user }, status: 202
        else
          render json: { data: @user.errors }, status: :unprocessable_entity
        end
      end

      def update
        @user = User.find(params[:id])
        @user.phones.build
        if @user.update_attributes(user_params)
          render json: { data: @user }, status: 202
        else
          render json: { data: @user.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        user = User.find(params[:id])
        user.destroy
        render json: { data: user }, status: :ok
      end

      private
        def user_params
          params.permit(:name, :status, :kind, :notes, phones_attributes: [:id, :kind, :user, :client, :num])
        end

        def list_phones(phones)
          list = {}
          options = []
          if phones.any?
            phones.map do |phone|
              list = {
                id: phone.id,
                tipo: phone.kind,
                numero: phone.num
              }
              options.append(list)
            end
          else
            options =  "Não possui"
          end
          return options
        end

        def list_users
          @users = User.order('created_at DESC').where(status: :active)
          options = []
          usuarios = {}
          @users.each do |user|
            usuarios = {
              nome: user.name,
              status: user.status,
              perfil: user.kind,
              observacoes: user.notes,
              telefones: list_phones(user.phones)
            }
            options.append(usuarios)
          end
          return options
        end

        def show_user
          @user = User.find(params[id])
        end

        def list_filter
          @users = User.where(user_params)
        end

    end
  end
end