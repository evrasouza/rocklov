describe "POST/equipos" do
  before(:all) do
    payload = { email: "everton@gmail.com", password: "pwd123" }
    result = Sessions.new.login(payload)
    @user_id = result.parsed_response["_id"]
  end

  context "Novo Equipo" do
    before(:all) do
      payload = {
        thumbnail: Helpers::get_thumb("kramer.jpg"),
        name: "kramer Eddie Van Halen",
        category: "Cordas",
        price: 299,
      }

      MongoDB.new.remove_equipo(payload[:name], @user_id)

      @result = Equipos.new.create(payload, @user_id)
    end

    it "valida status code 200" do
      expect(@result.code).to eql 200
    end
  end

  context "Nao Autorizado" do
    before(:all) do
      payload = {
        thumbnail: Helpers::get_thumb("baixo.jpg"),
        name: "Baixo do Steve Harris",
        category: "Cordas",
        price: 280,
      }

      @result = Equipos.new.create(payload, nil)
    end

    it "valida status code 401" do
      expect(@result.code).to eql 401
    end
  end
end
