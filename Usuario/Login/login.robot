*** Settings ***
Library           SeleniumLibrary
Documentation     Casos de Testes para Login de Usuário

*** Variables ***  
${LOGIN URL}      http://localhost/Teto-Facil/frontEnd/loginpage.php
${HOME URL}       http://localhost/Teto-Facil/frontEnd/homepage.php
${msgAlertLogin}  E-mail ou senha Inválidos
${BROWSER}        Chrome
${idLogin}        nomeLogin
${idSenha}        senhaLogin
${msgAlertEmail}  Email não encontrado

*** Test Cases ***
Realizar Login com Sucesso
    Open Browser    browser=${BROWSER}
    Maximize Browser Window
    Go To    url=${LOGIN URL}
    Input Text    locator=${idLogin}    text=cesar@gmail
    Input Text    locator=${idSenha}    text=123
    Capture Page Screenshot
    Click Button    locator=//button[@type='submit']
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    ${HOME URL}
    Page Should Contain    Olá, César Willian Pacheco
    Capture Page Screenshot
    Close Browser

Realizar Login sem senha
    Open Browser    browser=${BROWSER}
    Maximize Browser Window
    Go To    url=${LOGIN URL}
    Input Text    locator=${idLogin}    text=cesar@gmail
    Capture Page Screenshot
    Click Button    locator=//button[@type='submit']
    ${message}=    Handle Alert    Accept
    Should Be Equal As Strings    ${message}    ${msgAlertLogin}
    Close Browser

Realizar Login sem e-mail
    Open Browser    browser=${BROWSER}
    Maximize Browser Window
    Go To    url=${LOGIN URL}
    Input Text    locator=${idSenha}    text=123
    Capture Page Screenshot
    Click Button    locator=//button[@type='submit']
    ${message}=    Handle Alert    Accept
    Close Browser
    Should Be Equal As Strings    ${message}    ${msgAlertEmail}

Realizar Login sem e-mail e senha
    Open Browser    browser=${BROWSER}
    Maximize Browser Window
    Go To    url=${LOGIN URL}
    Capture Page Screenshot
    Click Button    locator=//button[@type='submit']
    ${message}=    Handle Alert    Accept
    Close Browser
    Should Be Equal As Strings    ${message}    ${msgAlertEmail}