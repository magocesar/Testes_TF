*** Settings ***
Documentation    Essa suíte testa o site teto facil 
Resource         cadastroCorretor_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
CT1 - Realizar cadastro de corretor 
	[Documentation]    Esse teste realiza o cadastro de um corretor 
	[Tags]             cadastroCorretor 
	Dado que o usuário acesse a página de login do site
	E o usuário digite o email
	E o usuário digite a senha
	E o usuário acione o botão login
	E o usuário acesse a página de cadastro de corretor
	E o usuário digite o nome de cadastro
	E o usuário digite o email de cadastro
    E o usuário digite o CPF de cadastro
    E o usuário digite o CRECI de cadastro
    E o usuário digite o telefone de cadastro
    E o usuário digite a senha de cadastro
    E o usuário digite a confirmação de senha de cadastro
    E o usuário acione o botão cadastrar
	Então o usuário deve aceitar a mensagem de cadastro realizado com sucesso

CT2 - Realizar Login com corretor criado 
	[Documentation]    Esse teste realiza o login de um corretor 
	[Tags]             loginCorretor 
	Dado que o usuário acesse a página de login do site
	E o usuário digite o login do novo corretor
    E o usuário digite a senha do novo corretor
    E o usuário acione o botão login 
	Então o sistema deve realizar o login com sucesso
	


CT3 - Realizar login falho de corretor 
	[Documentation]    Esse teste realiza o login falho de um corretor 
	[Tags]             loginCorretor emailFail
	Dado que o usuário acesse a página de login do site
	E o usuário digite o login errado de corretor
	E o usuário digite a senha do novo corretor
	E o usuário acione o botão login
	Então o usuário deve aceitar a mensagem de erro de login exibida pelo sistema

CT4 - Realizar login falho de corretor
	[Documentation]    Esse teste realiza o login falho de um corretor 
	[Tags]             loginCorretor senhaFail
	Dado que o usuário acesse a página de login do site
    E o usuário digite o login errado de corretor
    E o usuário digite a senha errada de corretor
	E o usuário acione o botão login
	Então o usuário deve aceitar a mensagem de erro de login exibida pelo sistema