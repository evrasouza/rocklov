#language: pt

Funcionalidade: Cadastro de Anúncios
    Sendo um usuário cadastrado no Rocklov que possui equipamento musicais
    Quero Cadastrar meus equipamentos
    Para que eu possa disponibiliza-los para locação

    Contexto: Login
        * Login com "everton@gmail.com" e "pwd123"

    @anuncios
    Cenário: Novo Equipo

        Dado que acesso o formulário de cadastro de anúncios
            E que eu tenho o seguinte equipamento:
            | thumb     | fender-sb.jpg |
            | nome      | Fender Strato |
            | categoria | Cordas        |
            | preco     | 200           |
        Quando submeto o cadastro desse item
        Então devo ver esse item no meu dashboard

    @tentativasCadastro
    Esquema do Cenário: Tentativa de cadastro de anúncios

        Dado que acesso o formulário de cadastro de anúncios
            E que eu tenho o seguinte equipamento:
            | thumb     | <foto>      |
            | nome      | <nome>      |
            | categoria | <categoria> |
            | preco     | <preco>     |
        Quando submeto o cadastro desse item
        Então deve conter a mensagem de alerta: "<saida>"

        Exemplos:
            | foto          | nome                  | categoria          | preco  | saida                             |
            |               | Microfone Shure       | Áudio e Tecnologia | 4000   | Adicione uma foto no seu anúncio! |
            | kramer.jpg    |                       | Cordas             | 150000 | Informe a descrição do anúncio!   |
            | trompete.jpg  | Trompete TOP          |                    | 3000   | Informe a categoria               |
            | fender-sb.jpg | Fender do Dave Murray | Cordas             |        | Informe o valor da diária         |