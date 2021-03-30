require "httparty"

describe "POST/sessions" do
  it "login com sucesso" do
    payload = { "email": "everton@gmail.com", "password": "pwd123" }

    result = HTTParty.post(
      "http://rocklov-api:3333/sessions",
      body: payload.to_json,
      headers: {
        "Content-Type": "application/json",
      },
    )

    expect(result.code).to eql 200
    expect(result.parsed_response["_id"].length).to eql 24

    #puts result
    #puts result.class
    #puts result.parsed_response
    #puts result.parsed_response.class
    #puts result.parsed_response["_id"]
  end
end
