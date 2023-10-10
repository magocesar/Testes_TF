*** Settings ***
Documentation    Essa suíte testa o site teto facil 
Resource         cadastroCorretor_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
CT1 - Realizar login 
	[Documentation]    Esse teste verifica o login de um usuario
	[Tags]             login_ativo
	Acessar a pagina home do site
	Digitar no campo usuário o usuário ativo
	Digitar no campo senha a senha o usuário ativo
	Acionar o botão entrar
	Verificar se nome do usuário aparece na tela de boas vindas

CT2 - Realizar cadastro de usuario
	[Documentation]    Esse teste verifica o cadastro de um usuario 
	[Tags]             login_inativo
	Acessar a pagina home do site	
	Digitar no campo usuário o usuário inativo
	Digitar no campo senha a senha o usuário inativo
	Acionar o botão entrar
	Verificar mensagem de falha no login



