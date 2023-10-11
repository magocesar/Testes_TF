*** Settings ***
Library           SeleniumLibrary
Documentation     Casos de Testes para Login de Usuário

*** Variables ***  
${CADASTRO URL}      http://localhost/Teto-Facil/frontEnd/loginpage.php
${HOME URL}       http://localhost/Teto-Facil/frontEnd/homepage.php
${BROWSER}        Chrome
${idEmail}        emailCad
${idNome}         name
${idCPF}          cpfCad
${idSenha}        senhaCad
${idSenhaConf}    senhaConf
${idButton}       sendCadButton

*** Test Cases ***
Realizar Cadstro com Sucesso
    Open Browser    browser=${BROWSER}
    Maximize Browser Window
    Go To    url=${CADASTRO URL}
    Input Text    locator=${idNome}    text=Rodrigo
    Input Text    locator=${idEmail}    text=rodrigo@gmail.com
    Input Text    locator=${idCPF}    text=12345678910
    Input Text    locator=${idSenha}    text=Rodrigo@1234
    Input Text    locator=${idSenhaConf}    text=Rodrigo@1234
    Capture Page Screenshot
    Click Button    locator=${idButton}
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    ${HOME URL}
    Page Should Contain    Olá, Rodrigo
    Capture Page Screenshot
    Close Browser

Realizar Cadastro sem CPF
    Open Browser    browser=${BROWSER}
    Maximize Browser Window
    Go To    url=${CADASTRO URL}
    Input Text    locator=${idNome}    text=Rodrigo
    Input Text    locator=${idEmail}    text=rodrigo@gmail.com
    Input Text    locator=${idSenha}    text=Rodrigo@1234
    Input Text    locator=${idSenhaConf}    text=Rodrigo@1234
    Capture Page Screenshot
    Click Button    locator=${idButton}
    ${message}=     Handle Alert    Accept
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    ${CADASTRO URL}
    Capture Page Screenshot
    Close Browser

Realizar Cadastro com senhas diferentes
    Open Browser    browser=${BROWSER}
    Maximize Browser Window
    Go To    url=${CADASTRO URL}
    Input Text    locator=${idNome}    text=Otavio  
    Input Text    locator=${idEmail}   text=otavio@gmail.com
    Input Text    locator=${idCPF}    text=12345678911
    Input Text    locator=${idSenha}    text=Otavio@1234
    Input Text    locator=${idSenhaConf}    text=Otavio@12345
    Capture Page Screenshot
    Click Button    locator=${idButton}
    ${message}=     Handle Alert    Accept
    Should Be Equal As Strings    ${message}    As senhas não são iguais !
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    ${CADASTRO URL}
    Capture Page Screenshot
    Close Browser