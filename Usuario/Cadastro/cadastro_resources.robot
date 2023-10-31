***Settings***
Library           SeleniumLibrary

*** Variables ***  
${CADASTRO URL}      http://localhost/Teto-Facil/frontEnd/loginpage.php
${HOME URL}       http://localhost/Teto-Facil/frontEnd/homepage.php
${BROWSER}        chrome
${EMAIL_CAD}        rodrigomunch@gmail.com
${EMAIL_CAD_2}      cesinha@gmail.com
${NOME_CAD}         Rodrigo
${CPF_CAD}          97864531208
${CPF_CAD_2}        71931846250
${SENHA_CAD}        Rodrigo@1234
${SENHA_CONF_CAD}    Rodrigo@1234
${SENHA_CONF_CAD_ERRADA}    Cesar@1234
${msgSenhasDiferentes}    As senhas não são iguais !   

***Keywords***

Abrir o navegador
	Open Browser	browser=${BROWSER}
	Maximize Browser Window

Fechar o navegador
	Capture Page Screenshot
	Close Browser

Dado que o usuário acesse a página de cadastro
    Go to  ${CADASTRO URL}

E o usuário preenche o formulário de cadastro com dados válidos
    Input Text    locator=name         text=${NOME_CAD}
    Input Text    locator=emailCad       text=${EMAIL_CAD}
    Input Text    locator=cpfCad         text=${CPF_CAD}
    Input Text    locator=senhaCad       text=${SENHA_CAD}
    Input Text    locator=senhaConf       text=${SENHA_CONF_CAD}
    Capture Page Screenshot

Quando o usuário clique no botão de cadastro
    Click Element    locator=sendCadButton

Então o sistema deve verificar se o cadastro foi realizado com sucesso
    ${current_url}=    Get Location
    Should Be Equal As Strings  ${current_url}    ${HOME URL}
    Page Should Contain    Olá, ${NOME_CAD}

E o usuário preenche o formulário de cadastro com duas senhas diferentes
    Input Text    locator=name         text=${NOME_CAD}
    Input Text    locator=emailCad       text=${EMAIL_CAD_2}
    Input Text    locator=cpfCad         text=${CPF_CAD_2}
    Input Text    locator=senhaCad       text=${SENHA_CAD}
    Input Text    locator=senhaConf       text=${SENHA_CONF_CAD_ERRADA}
    Capture Page Screenshot

Então o sistema não deve realizar o cadastro com senhas diferentes
    ${message}= 	Handle Alert	Accept
    Should Be Equal As Strings  ${message}    ${msgSenhasDiferentes}
    ${current_url}=    Get Location
    Should Be Equal As Strings  ${current_url}    ${CADASTRO URL}

E o usuário preenche o formulário de cadastro sem o campo CPF
    Input Text    locator=name         text=${NOME_CAD}
    Input Text    locator=emailCad       text=${EMAIL_CAD}
    Input Text    locator=senhaCad       text=${SENHA_CAD}
    Input Text    locator=senhaConf       text=${SENHA_CONF_CAD}
    Capture Page Screenshot

Então o sistema não deve realizar o cadastro
    ${message}= 	Handle Alert	Accept
    ${current_url}=    Get Location
    Should Be Equal As Strings  ${current_url}    ${CADASTRO URL}
