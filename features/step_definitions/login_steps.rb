Dado('que acesso a página principal') do
    visit "/"
end
  
Quando('submeto minhas credenciais com {string} e {string}') do |email, password|

    login_page = LoginPage.new
    login_page.campo_email.set email
    login_page.campo_senha.set password
    login_page.botão_entrar

end