*** Settings ***
Documentation    Essa suíte testa o site teto facil 
Resource         editImovel_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
CT1 - Editar dados de Imóvel
	[Documentation]    Esse teste realiza o cadastro de um corretor 
	[Tags]             cadastroCorretor 
	Acessar a pagina de login do site
	Digitar no campo email
	Digitar no campo senha a senha 
	Acionar o botão login
	Acessar a pagina de meus imoveis 
	Entrar na pagina do imovel
	Alterar cidade
	Acionar o botão Alterar Dados
	Validar mensagem de sucesso


	
  

