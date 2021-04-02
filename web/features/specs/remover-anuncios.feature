#language: pt

Funcionalidade: Remover Anúncios
    Sendo um anunciante que possui um equipamento indesejado
    Quero poder remover esse anúncio
    Para que eu possa manter meu dashboard atualizado

Contexto: Login
        * Login com "eloy@gmail.com" e "pwd123"

    @anuncio
    Cenario: Remover um anúncio

        Dado que eu tenho um anuncio indesejado:
            | thumb     | telecaster.jpg |
            | nome      | Telecaster     |
            | categoria | Cordas         |
            | preco     | 666            |
        Quando eu solicito a exclusao desse item
            E confirmo a exclusao
        Entao nao devo ver esse item no meu dashboard

    @desistir
    Cenario: Desistir da exclusao de um anúncio

        Dado que eu tenho um anuncio indesejado:
            | thumb     | conga.jpg |
            | nome      | conga     |
            | categoria | Outros    |
            | preco     | 99        |
        Quando eu solicito a exclusao desse item
            Mas nao confirmo a solicitacao
        Entao esse item deve permanecer no meu dashboard