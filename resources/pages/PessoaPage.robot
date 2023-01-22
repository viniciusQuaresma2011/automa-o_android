*** Settings ***
Resource    ../base/Base.robot



*** Keywords ***
Input Nome
    [Arguments]    ${nome}
    Wait Until Page Contains Element    TextInputNome
    Input Text    TextInputNome    ${nome}

Input Email
    [Arguments]    ${email}
    Wait Until Page Contains    TextInputEmail 
    Input Text    TextInputEmail    ${email}

Selecionar Identificacao
    [Arguments]    ${identificacao}
    Click Text    ${identificacao}

Selecionar Estado
    [Arguments]    ${estado}
    Wait Until Page Contains    Acre
    Click Text     Acre
    Wait Until Page Contains    ${estado}
    Click Text    ${estado}

Click Botão Cadastrar
    Click Element    BotaoCadastrar

Obter Texto Snackbar Toast
    Wait Until Page Contains    snackbar_text
    ${texto}    Get Text    snackbar_text
    RETURN     ${texto}