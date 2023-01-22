*** Settings ***
Resource    ../../base/Base.robot
Library    ../../../resources/factories/Pessoa.py

Test Setup    Open Session
Test Teardown    Close Session


*** Test Cases ***
Deve cadastrar uma Pessoa
    [Tags]    regression

    ${pessoa}    Factory Pessoa

    Click Botão Cadastrar Pessoa

    Input Nome    ${pessoa['nome']}
    Input Email   ${pessoa['email']}
    Selecionar Identificacao    Homem
    Selecionar Estado    Alagoas
    Click Botão Cadastrar

    ${mensagemSucesso}    Obter Texto Snackbar Toast
    Should Be Equal    Cadastro realizado com sucesso    ${mensagemSucesso}


Não deve cadastrar uma pessoa com o nome vazio

    ${pessoa}    Factory Pessoa

    Click Botão Cadastrar Pessoa

  
    Input Email   ${pessoa['email']}
    Selecionar Identificacao    Homem
    Selecionar Estado    Alagoas
    Click Botão Cadastrar
    
    Wait Until Page Contains    textinput_error
    ${mensagem_erro}        Get Text    textinput_error
    Should Be Equal        Insira o nome completo    ${mensagem_erro}    
    

Não deve cadastrar uma pessoa com o email vazio
    ${pessoa}    Factory Pessoa

    Click Botão Cadastrar Pessoa

    Input Nome    ${pessoa['nome']}

    Selecionar Identificacao    Homem
    Selecionar Estado    Alagoas
    Click Botão Cadastrar
    ${mensagem_erro}        Get Text    textinput_error
    Should Be Equal        Insira um email válido    ${mensagem_erro}    

Não deve cadastrar uma pessoa com o mesmo email

    ${pessoa}    Factory Pessoa

    Click Botão Cadastrar Pessoa

    Input Nome    ${pessoa['nome']}
    Input Email   ${pessoa['email']}
    Selecionar Identificacao    Homem
    Selecionar Estado    Acre
    Click Botão Cadastrar
    
   
    Input Nome    ${pessoa['nome']}
    Input Email   ${pessoa['email']}
    Selecionar Identificacao    Homem
    Selecionar Estado    Acre
    Click Botão Cadastrar

    ${mensagem_erro_email}    Obter Texto Snackbar Toast
    Should Be Equal    Email já cadastrado    ${mensagem_erro_email}
