*** Settings ***
Library	SeleniumLibrary

*** Variables ***
${BROWSER}	chrome 
${URL_LOGIN}		 http://localhost/Teto-Facil/frontEnd/loginpage.php
${URL_IMOVEL}		http://localhost/Teto-Facil/frontEnd/meusImoveis.php
${EMAIL_USER}	otavio@gmail
${SENHA_LOGIN}		123
${NOVA_CIDADE} 		Curitiba
${msgAlertDadosAlterados}		Imóvel atualizado com sucesso
${NOVO_VALOR}		1000000




*** Keywords ***
Abrir o navegador
	Open Browser	browser=${BROWSER}
	Maximize Browser Window

Fechar o navegador
	Capture Page Screenshot
	Close Browser

Dado que o usuário acessa a página de login do site
	Go To	url=${URL_LOGIN}

Quando o usuário digita o email "otavio@gmail" no campo de email 
	Input Text	locator=nomeLogin       text=${EMAIL_USER}

E o usuário digita a senha "123" no campo de senha 
	Input Text	locator=senhaLogin          text=${SENHA_LOGIN}

E o usuário aciona o botão "Login"
	Click Element	locator=sendLoginButton

E o usuário acessa a página de "Meus Imóveis"
	Go To	url=${URL_IMOVEL}

Quando o usuário altera a cidade do imóvel
  Input Text	css:input[name=edit_cidade]       text=${NOVA_CIDADE}

E o usuário aciona o botão "Alterar Dados"
  Click Element	locator=updateData

E o usuário entra na página do imóvel

  Click Element	locator=//div[contains(@class,'imovelblock')]
  Capture Page Screenshot

Então o usuário deve ver a mensagem de sucesso
	${message}=		Handle Alert	Accept
	Should Be Equal As Strings    ${message}	${msgAlertDadosAlterados}

Quando o usuário altera o valor do imóvel
  Input Text	css:input[name=edit_valor]       text=${NOVO_VALOR}	














