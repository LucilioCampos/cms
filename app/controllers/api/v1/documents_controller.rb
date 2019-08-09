module Api
  module V1
    class DocumentsController < ApplicationController

      def index
        documents = Document.order('created_at DESC')
        unless documents.empty?
          render json: documents, status: 200
        else
          render json: "Nenhum documento encontrado", status: 404
        end
      end

      def show
        document = Document.find(params[:id])
        if document
          render json: document, status: 200
        else
          render json: document.errors, status: 404
        end
      end

      def create
        document = Document.create(document_params)
        if document.save
          render json: document, status: 200
        else
          render json: document.errors, status: :unprocessable_entity
        end
      end

      def update
        document = Document.find(params[:id])
        if document.update_attributes
          render json: document, status: 202
        else
          render json: document, status: :unprocessable_entity
        end
      end

      def destroy
        document = Document.find(params[:id])
        if document.destroy
          render json: document, status: 204
        else
          render json: document, status: :unprocessable_entity
        end
      end

      private 
        def document_params
          params.permit(:kind, :num, :user_id, :client_id)
        end
    end
  end
end