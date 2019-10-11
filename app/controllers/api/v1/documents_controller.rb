module Api
  module V1
    class DocumentsController < BaseController

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
        doc = DocumentService.new(document_params).call
        document = Document.create(doc) if doc
        if doc && document.save
          render json: document, status: 201
        else
          render json: 'Favor verificar os dados informaods', status: :unprocessable_entity
        end
      end

      def update
        doc = DocumentService.new(document_params, params[:id]).call
        document = Document.find(params[:id]) if doc
        if doc && document.update_attributes(doc)
          render json: document, status: 202
        else
          render json: 'Favor verificar dados informados', status: :unprocessable_entity
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