describe "POST /equipos/{equipo_id}/bookings" do
  before(:all) do
    payload = { email: "rafael@gmail.com", password: "pwd123" }
    result = Sessions.new.login(payload)
    @user_id = result.parsed_response["_id"]
  end

  context "Solicitar locacao" do
    before(:all) do

      # dado que usuário_id tem um equipamento para locacao

      result = Sessions.new.login({ email: "murray@gmail.com", password: "pwd123" })
      usuário_id = result.parsed_response["_id"]

      equipamento = {
        thumbnail: Helpers::get_thumb("fender-sb.jpg"),
        name: "Fender do Dave Murray",
        category: "Cordas",
        price: 312,
      }
      MongoDB.new.remove_equipo(equipamento[:name], usuário_id)
      result_equipo = Equipos.new.create(equipamento, usuário_id)
      equipamento_id = result_equipo.parsed_response["_id"]

      # Quando solicito a locacao do equipamento
      @result = Equipos.new.booking(equipamento_id, @user_id)
    end

    it "Deve retornar code 200" do
      expect(@result.code).to eql 200
    end
  end
end
