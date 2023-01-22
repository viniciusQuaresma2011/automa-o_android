*** Settings ***
Resource    ../base/Base.robot

*** Variables ***
${botao_cadastrar}    button_cadastrar

*** Keywords ***
Click Botão Cadastrar Pessoa
    Wait Until Page Contains Element    ${botao_cadastrar}
    Click Element    ${botao_cadastrar}
