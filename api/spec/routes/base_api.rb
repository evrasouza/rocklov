# implementa o HTTPARTY
require "httparty"

# cria a classe BaseAPI
class BaseApi

  # inclui o HTTParty
  include HTTParty

  # define a "base_uri"
  base_uri "http://rocklov-api:3333"
end
