*** Settings ***
Library	SeleniumLibrary

*** Variables ***
${BROWSER}	chrome 
${HOME URL}       http://localhost/Teto-Facil/frontEnd/homepage.php
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
${msgErroLogin} 	Email não encontrado
${msgCadastroSucesso}	Corretor cadastrado com sucesso




*** Keywords ***
Abrir o navegador
	Open Browser	browser=${BROWSER}
	Maximize Browser Window

Fechar o navegador
	Capture Page Screenshot
	Close Browser

Dado que o usuário acesse a página de login do site
	Go To	url=${URL_LOGIN}

E o usuário digite o email
	Input Text	locator=nomeLogin       text=${EMAIL_USER}

E o usuário digite a senha
	Input Text	locator=senhaLogin          text=${SENHA_LOGIN}

E o usuário acione o botão login
	Click Element	locator=sendLoginButton

E o usuário acesse a página de cadastro de corretor
	Go To	url=${URL_CADASTRO_CORRETOR}

E o usuário digite o nome de cadastro
  Input Text	locator=name        text=${FULL_NAME}

E o usuário digite o email de cadastro
  Input Text	locator=email     text=${EMAIL_CAD}

E o usuário digite o CPF de cadastro
  Input Text	locator=cpf       text=${CPF}

E o usuário digite o CRECI de cadastro
	Input Text	locator=creci        text=${CRECI}

E o usuário digite o telefone de cadastro
	Input Text	locator=telefone        text=${TELEFONE}

E o usuário digite a senha de cadastro
  Input Text	locator=password        text=${SENHA_CAD}

E o usuário digite a confirmação de senha de cadastro
  Input Text	locator=passwordconfirm       text=${SENHA_CONF_CAD}

E o usuário acione o botão cadastrar
  Click Element	locator=acao



E o usuário digite o login do novo corretor 
	Input Text	locator=nomeLogin       text=${EMAIL_CAD}

E o usuário digite a senha do novo corretor
	Input Text	locator=senhaLogin          text=${SENHA_CAD}



E o usuário digite o login errado de corretor
	Input Text	locator=nomeLogin       text=pedro@gmail.com

E o usuário digite a senha errada de corretor
	Input Text	locator=senhaLogin          text=12

Então o usuário deve aceitar a mensagem de erro de login exibida pelo sistema
	${message}= 	Handle Alert	Accept
	Should Be Equal As Strings 	${message}	${msgErroLogin}

Então o usuário deve aceitar a mensagem de cadastro realizado com sucesso
	${message}= 	Handle Alert	Accept
	Should Be Equal As Strings 	${message}	${msgCadastroSucesso}

Então o sistema deve realizar o login com sucesso
	${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    ${HOME URL}
    Page Should Contain    Olá, Rafael de Sousa
    Capture Page Screenshot










