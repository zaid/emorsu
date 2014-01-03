class TokensController < ApplicationController

  def create
    render json: { token: Morsu::Parser.parse_plaintext(token_params[:token] || '') }
  end

  private

  def token_params
    params.permit(:token)
  end
end
