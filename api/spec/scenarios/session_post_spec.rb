describe "POST/sessions" do
  context "login com sucesso" do
    before(:all) do
      payload = { email: "everton@gmail.com", password: "pwd123" }
      @result = Sessions.new.login(payload)
    end

    it "valida status code 200" do
      expect(@result.code).to eql 201
    end

    it "valida id do usuário" do
      expect(@result.parsed_response["_id"].length).to eql 24
    end
  end

  #   examples = [
  #     {
  #       title: "Senha incorreta",
  #       payload: { email: "everton@gmail.com", password: "abc123" },
  #       code: 401,
  #       error: "Unauthorized",
  #     },
  #     {
  #       title: "Usuario nao existe",
  #       payload: { email: "404@gmail.com", password: "pwd123" },
  #       code: 401,
  #       error: "Unauthorized",
  #     },
  #     {
  #       title: "Email em Branco",
  #       payload: { email: "", password: "pwd123" },
  #       code: 412,
  #       error: "required email",
  #     },
  #     {
  #       title: "Sem o campo email",
  #       payload: { password: "pwd123" },
  #       code: 412,
  #       error: "required email",
  #     },
  #     {
  #       title: "Senha em branco",
  #       payload: { email: "everton@gmail.com", password: "" },
  #       code: 412,
  #       error: "required password",
  #     },
  #     {
  #       title: "Sem o campo senha",
  #       payload: { email: "everton@gmail.com" },
  #       code: 412,
  #       error: "required password",
  #     },
  #   ]

  examples = Helpers::get_fixture("login")

  examples.each do |e|
    context "#{e[:title]}" do
      before(:all) do
        @result = Sessions.new.login(e[:payload])
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

#puts result
#puts result.class
#puts result.parsed_response
#puts result.parsed_response.class
#puts result.parsed_response["_id"]
