describe "POST/equipos" do
  before(:all) do
    payload = { email: "everton@gmail.com", password: "pwd123" }
    result = Sessions.new.login(payload)
    @user_id = result.parsed_response["_id"]
  end

  context "Novo Equipo" do
    before(:all) do
      thumbnail = File.open(File.join(Dir.pwd, "spec/fixtures/images", "kramer.jpg"), "rb")

      payload = {
        thumbnail: thumbnail,
        name: "kramer Eddie Van Halen",
        category: "Cordas",
        price: 299,
      }

      @result = Equipos.new.create(payload, @user_id)
    end

    it "valida status code 200" do
      expect(@result.code).to eql 200
    end
  end
end
