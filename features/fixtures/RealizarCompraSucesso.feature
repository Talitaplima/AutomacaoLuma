            #language:pt

            Funcionalidade: Realizar compra com sucesso
            Eu como usuario do ecommerce Luma
            Gostaria de realizar login no sistema
            Para poder realizar uma compra e gerar um pedido

            Contexto:
            Dado que o usuario esteja no site Luma
            E tenha inserido <login> e <senha> válidos

            @login_sucesso
            Cenário: Autenticar login
            Então ele deverá ter seu login autenticado com sucesso

            @search
            Cenário: Buscar um produto com sucesso
            Quando o usuário pesquisar por "T-shirt" na barra de pesquisa
            Então resultados de busca deverão ser exibidos

            @carrinho
            Esquema do Cenário: Adicionar o produto no carrinho com sucesso
            Quando o usuário buscar um <produto>
            E selecionar o <tamanho>, <cor> e <quantidade>
            E clicar em Adicionar ao carrinho
            Então produto deverá ser adicionado ao carrinho com sucesso

            Exemplos:
            | produto       | tamanho | cor      | quantidade |
            | "Radiant Tee" | "XS"    | "Orange" | "1"        |

            @finalizarCompra
            Esquema do Cenario: Finalizar compra com sucesso
            Quando o usuário visitar o carrinho
            E clicar em Proceed to checkout
            E preencher todos os <campos> com sucesso
            E clicar no botão Place Order
            Então compra deverá ser realizada com sucesso

            Exemplos:
            | campos     |
            | "checkout" |
