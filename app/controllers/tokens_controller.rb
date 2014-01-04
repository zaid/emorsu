class TokensController < ApplicationController

  def create
    parsed_token = Morsu::Parser.parse_plaintext(token_params[:token]) if is_plaintext?
    parsed_token ||= Morsu::Parser.parse_morse_code(token_params[:token])

    render json: { token: parsed_token }
  end

  private

  def token_params
    params.permit(:token)
  end

  def is_plaintext?
    params[:token] =~ /\w+/
  end
end
