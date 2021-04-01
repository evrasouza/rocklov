describe "GET/equipos/{equipo_id}" do
  before(:all) do
    payload = { email: "everton@gmail.com", password: "pwd123" }
    result = Sessions.new.login(payload)
    @user_id = result.parsed_response["_id"]
  end

  context "Obter unico Equipo" do
    before(:all) do

      #dado que eu tenha um novo equipamento
      @payload = {
        thumbnail: Helpers::get_thumb("slash.jpg"),
        name: "Guitarra do Slash",
        category: "Cordas",
        price: 250,
      }
      MongoDB.new.remove_equipo(@payload[:name], @user_id)

      # e eu tenho o id deste equipamento
      equipo = Equipos.new.create(@payload, @user_id)
      @equipo_id = equipo.parsed_response["_id"]

      #Quando faço uma requisição get por id
      @result = Equipos.new.find_by_id(@equipo_id, @user_id)
    end

    it "Deve retornar 200" do
      expect(@result.code).to eql 200
    end

    it "Deve retornar o nome" do
      expect(@result.parsed_response).to include("name" => @payload[:name])
    end
  end

  context "Equipo nao existe" do
    before(:all) do
      @result = Equipos.new.find_by_id(MongoDB.new.get_mongo_id, @user_id)
    end

    it "Deve retornar 404" do
      expect(@result.code).to eql 404
    end
  end
end

describe "GET /equipos" do
  before(:all) do
    payload = { email: "rafael@gmail.com", password: "pwd123" }
    result = Sessions.new.login(payload)
    @user_id = result.parsed_response["_id"]
  end

  context "Obter uma lista" do
    before(:all) do
      #dado que eu tenho uma lista de equipos
      payloads = [
        {
          thumbnail: Helpers::get_thumb("slash.jpg"),
          name: "Guitarra do Slash",
          category: "Cordas",
          price: 250,
        },
        {
          thumbnail: Helpers::get_thumb("telecaster.jpg"),
          name: "Guitarra do John5",
          category: "Cordas",
          price: 330,
        },
        {
          thumbnail: Helpers::get_thumb("violino.jpg"),
          name: "Violino do Lucas Lima",
          category: "Cordas",
          price: 199,
        },
      ]

      payloads.each do |payload|
        MongoDB.new.remove_equipo(payload[:name], @user_id)
        Equipos.new.create(payload, @user_id)
      end

      #quando faço uma requisição GET para /equipos
      @result = Equipos.new.list(@user_id)
    end

    it "Deve retornar 200" do
      expect(@result.code).to eql 200
    end

    it "E deve retornar uma lista de equipos" do
      expect(@result.parsed_response).not_to be_empty
    end
  end
end
