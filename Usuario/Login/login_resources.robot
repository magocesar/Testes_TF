***Settings***
Library         SeleniumLibrary

***Variables***
${LOGIN URL}      http://localhost/Teto-Facil/frontEnd/loginpage.php
${HOME URL}       http://localhost/Teto-Facil/frontEnd/homepage.php
${URL_EMAIL_ALERT}      http://localhost/Teto-Facil/frontEnd/loginpage.php?Alert=Email%20n%C3%A3o%20encontrado
${URL_EMAIL_SENHA_ALERT}        http://localhost/Teto-Facil/frontEnd/loginpage.php?Alert=E-mail%20ou%20senha%20Inv%C3%A1lidos
${msgAlertLogin}  E-mail ou senha Inválidos
${BROWSER}        Chrome
${EMAIL_LOGIN}      cesar@gmail
${SENHA_LOGIN}      123
${msgAlertEmail}    Email não encontrado
${msgAlertSenha}    E-mail ou senha Inválidos

***Keywords***
Abrir o navegador
	Open Browser	browser=${BROWSER}
	Maximize Browser Window

Fechar o navegador
	Capture Page Screenshot
	Close Browser

Dado que o usuário acesse a página de login do site
    Go to  ${LOGIN URL}

E o usuáiro preencha os dados corretamente
    Input Text      locator=nomeLogin        text=${EMAIL_LOGIN}
    Input Text      locator=senhaLogin      text=${SENHA_LOGIN}
    Capture Page Screenshot

Quando o usuário clicar no botão de Login
    Click Element       locator=sendLoginButton

Então o sistema verifica se o login foi realizado com sucesso
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    ${HOME URL}
    Page Should Contain    Olá, César Willian Pacheco
    Capture Page Screenshot

E o usuário preenche apenas o campo de Email na área de login
    Input Text      locator=nomeLogin        text=${EMAIL_LOGIN}
    Capture Page Screenshot 

Então o sistema não deve realizar o login sem senha
    ${message}=    Handle Alert    Accept
    Should Be Equal As Strings    ${message}    ${msgAlertSenha}
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    ${URL_EMAIL_SENHA_ALERT}
    Capture Page Screenshot

E o usuário preenche apenas o campo de Senha na área de login
    Input Text      locator=senhaLogin        text=${SENHA_LOGIN}
    Capture Page Screenshot 

Então o sistema não deve realizar o login sem email
    ${message}=    Handle Alert    Accept
    Should Be Equal As Strings    ${message}    ${msgAlertEmail}
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    ${URL_EMAIL_ALERT}
    Capture Page Screenshot

E o usuário não preenche nenhum dos campos na área de login 
    Capture Page Screenshot

Então o sistema não deve realizar o login sem email e senha
    ${message}=    Handle Alert    Accept
    Should Be Equal As Strings    ${message}    ${msgAlertEmail}
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    ${URL_EMAIL_ALERT}
    Capture Page Screenshot






