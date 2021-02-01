            #language:pt

            Funcionalidade: Realizar cadastro de usuário com sucesso
            Para que o usuário possa acessar todas as funcionalidade do site
            Como cliente do ecommerce Luma
            Gostaria de realizar o cadastro com sucesso

            Contexto:
            Dado que o usuário esteja na página inicial do site Luma
            Quando ele clicar no botão Create an Account

            @teladecadastro
            Cenário: Acessar tela de cadastro
            Então deverá ser redirecionado para a tela de cadastro

            @cadastroSucesso
            Cenário: Realizar cadastro com sucesso
            Quando o usuário preencher todos os campos corretamente <nome>, <sobrenome>, <email>, <senha>, <confirmador>
            E clicar no botão para concluir cadastro
            Então cadastro deverá ser realizado com sucesso

            @cadastroSemSucesso
            Esquema do Cenário: Realizar cadastro sem sucesso
            Quando o preencher os campos <nome>, <sobrenome>, <email>, <senha>, <confirmador> incorretamente
            E clicar no botão para concluir cadastro
            Então deverá ser apresentada uma <mensagem>

            Exemplos:
            | nome     | sobrenome | email                | senha           | confirmador     | mensagem                                                       |
            | ""       | "Lima"    | "talita@hotmail.com" | "MAGENTO@2020!" | "MAGENTO@2020!" | "This is a required field."                                    |
            | "Talita" | "Lima"    | "@5sa415d64"         | "MAGENTO@2020!" | "MAGENTO@2020!" | "Please enter a valid email address (Ex: johndoe@domain.com)." |
