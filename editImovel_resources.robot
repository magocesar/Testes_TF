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

Acessar a pagina de login do site
	Go To	url=${URL_LOGIN}

Digitar no campo email 
	Input Text	locator=nomeLogin       text=${EMAIL_USER}

Digitar no campo senha a senha 
	Input Text	locator=senhaLogin          text=${SENHA_LOGIN}

Acionar o botão login
	Click Element	locator=sendLoginButton

Acessar a pagina de meus imoveis 
	Go To	url=${URL_IMOVEL}

Alterar cidade
  Input Text	css:input[name=edit_cidade]       text=${NOVA_CIDADE}

Acionar o botão Alterar Dados
  Click Element	locator=updateData

Entrar na pagina do imovel
  Click Element	locator=//div[contains(@class,'imovelblock')]
  Capture Page Screenshot

Validar mensagem de sucesso
	${message}=		Handle Alert	Accept
	Should Be Equal As Strings    ${message}	${msgAlertDadosAlterados}

Alterar valor do imovel
  Input Text	css:input[name=edit_valor]       text=${NOVO_VALOR}	














