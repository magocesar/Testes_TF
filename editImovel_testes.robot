*** Settings ***
Documentation    Essa suíte testa o site teto facil 
Resource         editImovel_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
CT1 - Editar dados de Imóvel
	[Documentation]    Esse teste realiza alteração do campo "Cidade" de um Imóvel 
	[Tags]             cadastroCorretor 
	
    Dado que o usuário acessa a página de login do site
    Quando o usuário digita o email "otavio@gmail" no campo de email
    E o usuário digita a senha "123" no campo de senha
    E o usuário aciona o botão "Login"
    E o usuário acessa a página de "Meus Imóveis"
    E o usuário entra na página do imóvel

    Quando o usuário altera a cidade do imóvel
    E o usuário aciona o botão "Alterar Dados"
    Então o usuário deve ver a mensagem de sucesso

CT2 - Editar valor do Imovel
	[Documentation]    Esse teste realiza alteração no preço de um Imóvel
	[Tags]             editarValorImovel
    Dado que o usuário acessa a página de login do site
    Quando o usuário digita o email "otavio@gmail" no campo de email
    E o usuário digita a senha "123" no campo de senha
    E o usuário aciona o botão "Login"
    E o usuário acessa a página de "Meus Imóveis"
    E o usuário entra na página do imóvel

    Quando o usuário altera o valor do imóvel
    E o usuário aciona o botão "Alterar Dados"
    Então o usuário deve ver a mensagem de sucesso
	
  

