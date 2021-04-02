#language: pt

Funcionalidade: Reeber pedidos de Loação
    Sendo um anunciante que possui um equipamento cadastrados
    Desejo reeber pedidos de locação
    Para que eu possa decidir se quero prova-los ou rejeita-los

    @anuncio
    Cenario: Receber pedido

        Dado que meu perfil de anunciante é "joao@anuciante.com" e "pwd123"
            E que eu tenho o seguinte equipamento cadastrado:
            | thumb     | clarinete.jpg |
            | nome      | Clarinete     |
            | categoria | Outro         |
            | preco     | 333           |
            E acesso meu dashboard
        Quando "maria@locataria.com" e "pwd123" solicita a locacao desse equipo
        Entao devo ver a seguinte mensagem:
            """
            maria@locataria.com deseja alugar o equipamento: Clarinete em: DATA_ATUAL
            """
            E devo ver os links: "ACEITAR" e "REJEITAR" no pedido
