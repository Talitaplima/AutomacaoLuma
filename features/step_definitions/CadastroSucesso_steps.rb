Dado(/^que o usuário esteja na página inicial do site Luma$/) do
    @cadastro.visitarPaginaLuma
end
  
Quando(/^ele clicar no botão Create an Account$/) do 
    @cadastro.clicarPaginaCriarConta
end
  
Então(/^deverá ser redirecionado para a tela de cadastro$/) do
    @cadastro.validarPageCadastro 
end
  
Dado(/^que o usuário esteja na página de cadastro$/) do
    @cadastro.clicarPaginaCriarConta
end
  
Quando(/^o usuário preencher todos os campos corretamente ([^"]*), ([^"]*), ([^"]*),([^"]*), ([^"]*)$/) do |nome, sobrenome, email, senha, confirmador|
    @cadastro.clicarPaginaCriarConta
    @cadastro.preencherCampos("Talita", "Lima", "talita.limas1@webjump.com", "W3bjump@2020", "W3bjump@2020") 
end
  
Quando(/^clicar no botão para concluir cadastro$/) do
    @cadastro.clicarBotaoCriar 
end
  
Então(/^cadastro deverá ser realizado com sucesso$/) do
    @cadastro.validaContaCriada
end

Quando('o preencher os campos {string}, {string}, {string}, {string}, {string} incorretamente') do |nome, sobrenome, email, senha, confirmador|
    @cadastro.preencherCampos(nome, sobrenome, email, senha, confirmador)
  end
  
  Então('deverá ser apresentada uma {string}') do |mensagem|
    @cadastro.alertas(mensagem)
  end  