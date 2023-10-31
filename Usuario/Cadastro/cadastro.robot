*** Settings ***
Library           SeleniumLibrary
Documentation     Casos de cadastro para Login de Usuário
Resource         cadastro_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador



*** Test Cases ***
CT1 - Realizar Cadstro com Sucesso
    [Documentation]    Caso de teste para realizar cadastro com sucesso
    [Tags]    cadastroCorretor
    Dado que o usuário acesse a página de cadastro
    E o usuário preenche o formulário de cadastro com dados válidos
    Quando o usuário clique no botão de cadastro
    Então o sistema deve verificar se o cadastro foi realizado com sucesso


CT2 - Realizar Cadastro sem CPF
    [Documentation]    Caso de teste para realizar cadastro sem o campo CPF preenchido
    [Tags]    cadastroCorretorSemCPF
    Dado que o usuário acesse a página de cadastro
    E o usuário preenche o formulário de cadastro sem o campo CPF
    Quando o usuário clique no botão de cadastro
    Então o sistema não deve realizar o cadastro

CT3 - Realizar Cadastro com senhas diferentes
    [Documentation]    Caso de teste para realizar cadastro com senhas diferentes
    [Tags]    cadastroCorretorSenhaDiferente
    Dado que o usuário acesse a página de cadastro
    E o usuário preenche o formulário de cadastro com duas senhas diferentes
    Quando o usuário clique no botão de cadastro
    Então o sistema não deve realizar o cadastro com senhas diferentes