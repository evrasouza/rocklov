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