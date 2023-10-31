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
${CPF_CAD_2}        22222222222
${SENHA_CAD}        Rodrigo@1234
${SENHA_CONF_CAD}    Rodrigo@1234
${SENHA_CONF_CAD_ERRADA}    Rodrigo@12345
${msgSenhasDiferentes}    As senhas não são iguais !   

***Keywords***

Abrir o navegador
	Open Browser	browser=${BROWSER}
	Maximize Browser Window

Fechar o navegador
	Capture Page Screenshot
	Close Browser

Acessar a página de cadastro
    Go to  ${CADASTRO URL}

Preencher o formulário de cadastro com dados válidos
    Input Text    locator=name         text=${NOME_CAD}
    Input Text    locator=emailCad       text=${EMAIL_CAD}
    Input Text    locator=cpfCad         text=${CPF_CAD}
    Input Text    locator=senhaCad       text=${SENHA_CAD}
    Input Text    locator=senhaConf       text=${SENHA_CONF_CAD}
    Capture Page Screenshot

Clicar no botão de cadastro
    Click Element    locator=sendCadButton

Verificar se o cadastro foi realizado com sucesso
    ${current_url}=    Get Location
    Should Be Equal As Strings  ${current_url}    ${HOME URL}
    Page Should Contain    Olá, ${NOME_CAD}

Preencher o formulário de cadastro com senhas diferentes
    Input Text    locator=name         text=${NOME_CAD}
    Input Text    locator=emailCad       text=${EMAIL_CAD_2}
    Input Text    locator=cpfCad         text=${CPF_CAD_2}
    Input Text    locator=senhaCad       text=${SENHA_CAD}
    Input Text    locator=senhaConf       text=${SENHA_CONF_CAD_ERRADA}
    Capture Page Screenshot

Verificar se o cadastro com senhas diferentes não foi realizado
    ${message}= 	Handle Alert	Accept
    Should Be Equal As Strings  ${message}    ${msgSenhasDiferentes}
    ${current_url}=    Get Location
    Should Be Equal As Strings  ${current_url}    ${CADASTRO URL}

Preencher o formulário de cadastro sem o campo CPF
    Input Text    locator=name         text=${NOME_CAD}
    Input Text    locator=emailCad       text=${EMAIL_CAD}
    Input Text    locator=senhaCad       text=${SENHA_CAD}
    Input Text    locator=senhaConf       text=${SENHA_CONF_CAD}
    Capture Page Screenshot

Verificar se o cadastro sem CPF diferentes não foi realizado
    ${message}= 	Handle Alert	Accept
    ${current_url}=    Get Location
    Should Be Equal As Strings  ${current_url}    ${CADASTRO URL}
