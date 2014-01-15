require 'spec_helper'

describe TokensController do
  describe "POST 'create'" do
    let(:data) { ActiveSupport::JSON.decode(response.body) }

    it "should be successful" do
      post :create, token: { content: nil }

      expect(response).to be_success
    end

    it "should return an empty JSON string if nothing is passed in" do
      post :create, token: { content: nil }

      expect(data['token']['result']).to be_blank
    end

    context "plaintext" do
      let(:plaintext_token) { "Hello World" }

      it "should convert plaintext to Morse code" do
        post :create, token: { content: plaintext_token }

        expect(data['token']['result']).to eq(Morsu::Parser.parse_plaintext(plaintext_token))
      end

      it "should return the original content in 'content'" do
        post :create, token: { content: plaintext_token }

        expect(data['token']['content']).to eq(plaintext_token)
      end
    end

    context "morse code" do
      let(:morse_code) { '... --- ...' }

      it "should convert Morse code to plaintext" do
        post :create, token: { content: morse_code }

        expect(data['token']['result']).to eq(Morsu::Parser.parse_morse_code(morse_code))
      end

      it "should return the original content in 'content'" do
        post :create, token: { content: morse_code }

        expect(data['token']['content']).to eq(morse_code)
      end

    end
  end
end
