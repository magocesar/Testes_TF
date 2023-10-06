*** Settings ***
Library	SeleniumLibrary

*** Variables ***
${BROWSER}	chrome 
${URL}		http://165.227.93.41/lojinha-web/
${EMAIL_USER}	rafael@gmail.com
${SENHA_LOGIN}		123456
${SENHA_CONFIRMACAO}	123456
${FULL_NAME}	Rafael de Sousa
${CPF}	132.776.990-02




*** Keywords ***
Abrir o navegador
	Open Browser	browser=${BROWSER}
	Maximize Browser Window

Fechar o navegador
	Capture Page Screenshot
	Close Browser

Acessar a pagina home do site
	Go To	url=${URL}

Digitar no campo usuário o usuário ativo
	Input Text	locator=nomeLogin       ${USUARIO_ATIVO}

Digitar no campo senha a senha o usuário ativo
	Input Text	locator=senhaLogin          ${SENHA_LOGIN}

Acionar o botão entrar
	Click Element	locator=sendLoginButton

Digitar no campo nome de cadastro 
  Input Text	css:input[name=name]        ${FULL_NAME}

Digitar no campo email de cadastro
  Input Text	locator=emailCad      ${EMAIL_USER}

Digitar no campo cpf de cadastro
  Input Text	locator=cpfCad        ${CPF}

Digitar no campo senha de cadastro 
  Input Text	locator=senhaCad        ${SENHA_LOGIN}

Digitar no campo confirmação de senha de cadastro
  Input Text	locator=senhaConf        ${SENHA_CONFIRMACAO}

Acionar o botão cadastrar
  Click Element	locator=sendCadButton








