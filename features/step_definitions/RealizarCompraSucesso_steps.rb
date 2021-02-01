Dado('que o usuario esteja no site Luma') do
    @cadastro.visitarPaginaLuma   
end
  
Dado(/^tenha inserido ([^"]*) e ([^"]*) válidos$/) do |usuario, senha|
    @compras.btnSignIn
    @compras.login("roni_cost@example.com","roni_cost3@example.com")
end
  
Então('ele deverá ter seu login autenticado com sucesso') do
   @compras.autenticarLogin
end
  
Quando('o usuário pesquisar por {string} na barra de pesquisa') do |produto|
   @compras.realizarBusca(produto)
end
  
Então('resultados de busca deverão ser exibidos') do
   @compras.resultadosBusca
end
  
Quando('o usuário buscar um {string}') do |produto|
  @compras.realizarBusca(produto)
  @compras.selecionarProduto(produto)
end

Quando('selecionar o {string}, {string} e {string}') do |tamanho, cor, quantidade|
  @compras.selecionarTamanho(tamanho)
  @compras.selecionarCor(cor)
  @compras.informarQuantidade(quantidade)
end

Quando('clicar em Adicionar ao carrinho') do
  @compras.adicionarCarrinho
end

Então('produto deverá ser adicionado ao carrinho com sucesso') do
  @compras.sucessoCarrinho
end

Quando('o usuário visitar o carrinho') do
    @compras.realizarBusca("Radiant Tee")
    @compras.selecionarProduto("Radiant Tee")
    @compras.selecionarTamanho("XS")
    @compras.selecionarCor("Orange")
    @compras.informarQuantidade("2")
    @compras.adicionarCarrinho
    @compras.irParaCarrinho
end

Quando('clicar em Proceed to checkout') do
  @compras.irCheckout
end

Quando('preencher todos os {string} com sucesso') do |checkout|
  visit "https://magento.nublue.co.uk/checkout/#shipping"
  file = YAML.load_file(File.join(Dir.pwd, "features/support/config/dados_checkout.yaml"))
  @dados = file[checkout]
  @compras.preencherDadosCheckout(@dados)
  #@compras.selecionarShipping
  @compras.clickNext
end

Quando('clicar no botão Place Order') do
  @compras.clickPlaceOrder
end

Então('compra deverá ser realizada com sucesso') do
  @compras.validaSucessoCompra
end
  