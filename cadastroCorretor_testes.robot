*** Settings ***
Documentation    Essa suíte testa o site teto facil 
Resource         cadastroCorretor_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
CT1 - Realizar cadastro de corretor 
	[Documentation]    Esse teste realiza o cadastro de um corretor 
	[Tags]             cadastroCorretor 
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
	Acionar o botão cadastrar
	Aceitar mensagem cadastro realizado com sucesso

CT2 - Realizar Login com corretor criado 
	[Documentation]    Esse teste realiza o login de um corretor 
	[Tags]             loginCorretor 
	Acessar a pagina de login do site
	Digitar o login do novo corretor 
	Digitar a senha do novo corretor 
	Acionar o botão login


CT3 - Realizar login falho de corretor 
	[Documentation]    Esse teste realiza o login falho de um corretor 
	[Tags]             loginCorretor emailFail
	Acessar a pagina de login do site
	Digitar login errado de corretor 
	Digitar a senha do novo corretor 
	Acionar o botão login
	Aceitar erro de login

CT4 - Realizar login falho de corretor
	[Documentation]    Esse teste realiza o login falho de um corretor 
	[Tags]             loginCorretor senhaFail
	Acessar a pagina de login do site
	Digitar login errado de corretor 
	Digitar senha errada de corretor 
	Acionar o botão login
	Aceitar erro de login