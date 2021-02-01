class CadastroPage
    include Capybara::DSL

    def visitarPaginaLuma
        visit ""
    end

    def clicarPaginaCriarConta
        click_link "Create an Account"
    end

    def validarPageCadastro
        find(".page-title-wrapper .page-title span").text
    end

    def preencherCampos(nome, sobrenome, email, senha, confirmador)
        find('#firstname').set nome
        find('#lastname').set sobrenome
        find('#email_address').set email
        find('#password').set senha
        find('#password-confirmation').set confirmador
    end

    def clicarBotaoCriar
        click_button "Create an Account"
    end

    def validaContaCriada
        find("div[class='message-success success message']").text
    end

    def alertas(mensagem)
            
        if mensagem == "This is a required field."
            find('#firstname-error').text
        else mensagem == "Please enter a valid email address (Ex: johndoe@domain.com)."
            find('#email_address-error').text
        end
    end

end