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
    Acessar a página de cadastro
    Preencher o formulário de cadastro com dados válidos
    Clicar no botão de cadastro
    Verificar se o cadastro foi realizado com sucesso


Realizar Cadastro sem CPF
    Acessar a página de cadastro
    Preencher o formulário de cadastro sem o campo CPF
    Clicar no botão de cadastro
    Verificar se o cadastro sem CPF diferentes não foi realizado

Realizar Cadastro com senhas diferentes
    Acessar a página de cadastro
    Preencher o formulário de cadastro com senhas diferentes
    Clicar no botão de cadastro
    Verificar se o cadastro com senhas diferentes não foi realizado