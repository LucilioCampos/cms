class RootController < ApplicationController

  def index
    render json: {
      get: {
        user: '/api/v1/users',
        client: '/api/v1/client',
        phones: '/api/v1/phones',
        kinds: '/api/v1/kinds'
      }
  }
  end

end