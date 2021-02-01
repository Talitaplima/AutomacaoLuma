class Compras
    include Capybara::DSL

    def btnSignIn
        click_link "Sign In"
    end

    def login(usuario, senha)
        find("#email"). set usuario
        find("#pass").set senha
        click_button "Sign In"
    end

    def autenticarLogin
        find(".customer-name").text
    end

    def realizarBusca(produto)
        busca = find("#search")
        busca.set produto
        busca.send_keys :enter
    end

    def resultadosBusca
        find(".toolbar-amount")
    end

    def selecionarProduto(produto)
        #find("a[href*=radiant-tee]").click
        first(".product-item-info > a").click
        #find("div[class=product-item-info]>a*=radiant-tee").click
    end
        
    def selecionarTamanho(tamanho)
        case tamanho
        when "XS"
            find("#option-label-size-142-item-167").click
        when "S"
            find("#option-label-size-142-item-168").click
        when "M"
            find("#option-label-size-142-item-169").click
        when "L"
            find("#option-label-size-142-item-170").click
        when "XL"
            find("#option-label-size-142-item-171").click
        end
    end

    def selecionarCor(cor)
        case cor
        when "Blue"
            find("#option-label-color-93-item-50").click
        when "Orange"
            find("#option-label-color-93-item-56").click
        when "Purple"
            find("#option-label-color-93-item-57").click
        end
    end

    def informarQuantidade(quantidade)
        find("#qty").set quantidade
    end

    def adicionarCarrinho
        click_button "Add to Cart"
    end

    def sucessoCarrinho
        find("div[role=alert]>div>div>a").click
    end

    def irParaCarrinho
        click_link "shopping cart"
        #find("a[href*=checkout]").click
    end

    def irCheckout
        click_button "Proceed to Checkout"
    end

    def preencherDadosCheckout(dados)
        find("input[name=company]").set dados["company"]
        first("input[name*=street]").set dados["streetAdress"]
        find("input[name=city]").set dados["city"]

        #selectbox State
        selectState = find("select[name=region_id]")
        selectState.find('option', text: dados["state"]).select_option


        find("input[name=postcode]").set dados["zip"]
        find("input[name=telephone]").set dados["phone"]

        if dados["shipping"] == "Fixed"
            find("input[name=ko_unique_1]").click
        else
            find("input[name=ko_unique_2]").click
        end
    end
    
    def clickNext
        click_button "Next"
    end

    def clickPlaceOrder
        click_button "Place Order"
    end

    def validaSucessoCompra
        find("span[class=base]").text == "Thank you for your purchase!"
    end

end