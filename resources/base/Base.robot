*** Settings ***
Documentation    Configurações appium

Library    AppiumLibrary
Resource    ../../resources/pages/MainPage.robot
Resource    ../../resources/pages/PessoaPage.robot




*** Keywords ***
Open Session
    
    Set Appium Timeout    10

    Open Application    http://127.0.0.1:4723/wd/hub
    ...    platformName=Android
    ...    deviceName=Any
    ...    app=${EXECDIR}\\resources\\apks\\app-curso-appium.apk
    ...    appPackage=com.example.cursoappium

Close Session
    Capture Page Screenshot
    Close Application