require 'spec_helper'

describe TokensController do
  describe "POST 'create'" do
    let(:data) { ActiveSupport::JSON.decode(response.body) }

    it "should be successful" do
      post :create, token: nil

      expect(response).to be_success
    end

    it "should return an empty JSON string if nothing is passed in" do
      post :create, token: nil

      expect(data['token']).to be_blank
    end

    context "plaintext" do
      let(:plaintext_token) { "Hello World" }

      it "should convert plaintext to Morse code" do
        post :create, token: plaintext_token

        expect(data['token']).to eq(Morsu::Parser.parse_plaintext(plaintext_token))
      end
    end

    context "morse code" do
      let(:morse_code) { '... --- ...' }

      it "should convert Morse code to plaintext" do
        post :create, token: morse_code

        expect(data['token']).to eq(Morsu::Parser.parse_morse_code(morse_code))
      end
    end
  end
end
