require_relative "routes/signup"
require_relative "libs/mongo"
require_relative "helpers"

describe "POST/signup" do
  context "Novo Usuario" do
    before(:all) do
      payload = { name: "Janick Gers", email: "gers@gmail.com", password: "pwd123" }
      MongoDB.new.remove_user(payload[:email])

      @result = Signup.new.create(payload)
    end

    it "valida status code 200" do
      expect(@result.code).to eql 200
    end

    it "valida id do usuário" do
      expect(@result.parsed_response["_id"].length).to eql 24
    end
  end

  context "Usuario ja Existe" do
    before(:all) do
      payload = { name: "Peter Gabriel", email: "peter@gmail.com", password: "pwd123" }
      MongoDB.new.remove_user(payload[:email])
      Signup.new.create(payload)
      @result = Signup.new.create(payload)
    end

    it "deve retornar 409" do
      expect(@result.code).to eql 409
    end

    it "valida mensagem de erro: Email already exists :(" do
      expect(@result.parsed_response["error"]).to eql "Email already exists :("
    end
  end

  #name
  #email
  #password

  examples = Helpers::get_fixture("user")

  examples.each do |e|
    context "#{e[:title]}" do
      before(:all) do
        @result = Signup.new.create(e[:payload])
      end

      it "valida status code #{e[:code]}" do
        expect(@result.code).to eql e[:code]
      end

      it "valida id do usuário #{e[:error]}" do
        expect(@result.parsed_response["error"]).to eql e[:error]
      end
    end
  end
end
