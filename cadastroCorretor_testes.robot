*** Settings ***
Documentation    Essa suíte testa o site teto facil 
Resource         cadastroCorretor_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
CT1 - Realizar login 
	[Documentation]    Esse teste verifica o login de um usuario
	[Tags]             login_inativo
	Acessar a pagina de login do site
	Digitar no campo email
	Digitar no campo senha a senha 
	Acionar o botão login
	Acessar a pagina de cadastro de corretor
	Digitar no campo nome de cadastro 
	Digitar no campo email de cadastro
	Digitar no campo cpf de cadastro
	Digitar no campo creci de cadastro
	Digitar no campo telefone de cadastro
	Digitar no campo senha de cadastro 
	Digitar no campo confirmação de senha de cadastro

