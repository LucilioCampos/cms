class DocumentService < ApplicationService
  attr_reader :params, :object
  def initialize(params, id=nil)
    @params = params
    @object = Document.find(id) if id
  end

  def call
    valid_state
  end

  def valid_state
    if @object
      user_id =  @object.user_id != nil ? true : false
      client_id =  @object.client_id  != nil ? true : false
      doc_type = @object.kind != @params[:kind] ? true : false
      unless valid_params?
        return @params if !user_id && !client_id && !doc_type
      else
        return
      end
    end
    return @params unless valid_params?
  end

  def valid_params?
    return true if @params[:client_id] && @params[:user_id]
  end

end