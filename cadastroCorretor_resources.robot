*** Settings ***
Library	SeleniumLibrary

*** Variables ***
${BROWSER}	chrome 
${URL_HOMEPAGE} http://localhost/Teto-Facil/frontEnd/homepage.php 
${URL_LOGIN}		 http://localhost/Teto-Facil/frontEnd/loginpage.php
${URL_CADASTRO_CORRETOR}		http://localhost/Teto-Facil/frontEnd/adminPage.php
${EMAIL_USER}	admintf@admin
${SENHA_LOGIN}		2903
${FULL_NAME}	Rafael de Sousa
${EMAIL_CAD}	rafaelSousa@gmail.com 
${CPF}	132.776.990-02
${CRECI}	12.1234.12
${TELEFONE}	41991900981
${SENHA_CAD}	123
${SENHA_CONF_CAD}	123




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
	Input Text	locator=nomeLogin       ${EMAIL_USER}

Digitar no campo senha a senha
	Input Text	locator=senhaLogin          ${SENHA_LOGIN}

Acionar o botão entrar
	Click Element	locator=sendLoginButton

Acessar a pagina de cadastro de corretor
	Go To	url=${URL_CADASTRO_CORRETOR}

Digitar no campo nome de cadastro 
  Input Text	locator=name        ${FULL_NAME}

Digitar no campo email de cadastro
  Input Text	locator=email     ${EMAIL_CAD}

Digitar no campo cpf de cadastro
  Input Text	locator=cpf       ${CPF}

Digitar no campo creci de cadastro
	Input Text	locator=creci        ${CRECI}

Digitar no campo telefone de cadastro
	Input Text	locator=telefone        ${TELEFONE}

Digitar no campo senha de cadastro 
  Input Text	locator=password        ${SENHA_CAD}

Digitar no campo confirmação de senha de cadastro
  Input Text	locator=passwordconfirm        ${SENHA_CONF_CAD}

Acionar o botão cadastrar
  Click Element	css:input[name=acao]








