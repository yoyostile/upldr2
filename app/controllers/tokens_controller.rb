class TokensController < ApplicationController

  def index
    render json: { token: Token.new.to_s }
  end

end
