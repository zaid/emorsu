class TokensController < ApplicationController

  def create
    parsed_token = Morsu::Parser.parse_plaintext(token_params[:content]) if is_plaintext?
    parsed_token ||= Morsu::Parser.parse_morse_code(token_params[:content])

    render json: { token: { content: token_params[:content], result: parsed_token } }
  end

  private

  def token_params
    params.require(:token).permit(:content)
  end

  def is_plaintext?
    params[:token][:content] =~ /\w+/
  end
end
