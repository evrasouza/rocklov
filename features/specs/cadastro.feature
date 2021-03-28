#language: pt

Funcionalidade: Cadastro
    Sendo um músico que possui equipamentos musicais
    Quero fazer o meu cadastro no RockLov
    Para que eu possa disponibilizá-los para locação

    @Cadastro
    Cenario: Fazer cadastro

        Dado que acesso a página de cadastro
        Quando submeto o seguinte forulário de cadastro:
            | nome          | email            | senha  |
            | Adrian Smith  | smith@gmal.com   | pwd123 |
        Então sou redirecionado para o Dashboard

    Esquema do Cenário: Tentativa de Cadastro

        Dado que acesso a página de cadastro
        Quando submeto o seguinte forulário de cadastro:
            | nome         | email         | senha         |
            | <nome_input> | <email_input> | <senha_input> |
        Então vejo a mensagem de alerta: "<mensagem_output>"

        Exemplos:
            | nome_input    | email_input   | senha_input | mensagem_output                  |
            |               | evra@evra.com | pwd123      | Oops. Informe seu nome completo! |
            | Everton Souza |               | pwd123      | Oops. Informe um email válido!   |
            | Everton Souza | evra.evra.com | pwd123      | Oops. Informe um email válido!   |
            | Everton Souza | evra&evra.com | pwd123      | Oops. Informe um email válido!   |
            | Everton Souza | evra@evra.com |             | Oops. Informe sua senha secreta! |