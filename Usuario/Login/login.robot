*** Settings ***
Library           SeleniumLibrary
Documentation     Casos de Testes para Login de Usuário
Resource         login_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Variables ***  
${LOGIN URL}      http://localhost/Teto-Facil/frontEnd/loginpage.php
${HOME URL}       http://localhost/Teto-Facil/frontEnd/homepage.php
${msgAlertLogin}  E-mail ou senha Inválidos
${BROWSER}        Chrome
${idLogin}        nomeLogin
${idSenha}        senhaLogin
${msgAlertEmail}  Email não encontrado

*** Test Cases ***
CT1 - Realizar Login com Sucesso
    [Documentation]    Caso de teste para realizar LOGIN com sucesso
    [Tags]             login
    Dado que o usuário acesse a página de login do site
    E o usuáiro preencha os dados corretamente
    Quando o usuário clicar no botão de login
    Então o sistema verifica se o login foi realizado com sucesso

CT2 - Realizar Login sem senha  
    [Documentation]    Caso de teste para tentar realizar login sem senha
    [Tags]             loginSemSenha
    Dado que o usuário acesse a página de login do site
    E o usuário preenche apenas o campo de Email na área de login
    Quando o usuário clicar no botão de login
    Então o sistema não deve realizar o login sem senha

CT3 - Realizar Login sem e-mail
    [Documentation]    Caso de teste para tentar realizar login sem e-mail
    [Tags]             loginSemEmail
    Dado que o usuário acesse a página de login do site
    E o usuário preenche apenas o campo de Senha na área de login
    Quando o usuário clicar no botão de login
    Então o sistema não deve realizar o login sem email

CT4 - Realizar Login sem e-mail e senha
    [Documentation]    Caso de teste para tentar realizar login sem senha e e-mail
    [Tags]             loginSemEmailSenha
    Dado que o usuário acesse a página de login do site
    E o usuário não preenche nenhum dos campos na área de login  
    Quando o usuário clicar no botão de login
    Então o sistema não deve realizar o login sem email e senha