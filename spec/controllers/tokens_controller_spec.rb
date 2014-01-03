require 'spec_helper'

describe TokensController do
  describe "POST 'create'" do
    let(:data) { ActiveSupport::JSON.decode(response.body) }

    it "should be successful" do
      post :create, token: nil

      expect(response).to be_success
    end

    context "plaintext" do
      let(:plaintext_token) { "Hello World" }

      it "should return an empty JSON string if nothing is passed in" do
        post :create, token: nil

        expect(data['token']).to be_blank
      end

      it "should convert plaintext to Morse code" do
        post :create, token: plaintext_token

        expect(data['token']).to eq(Morsu::Parser.parse_plaintext(plaintext_token))
      end
    end
  end
end
