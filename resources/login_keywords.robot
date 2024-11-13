*** Settings ***
Resource    resource.robot
Documentation    Keywords para testar a feature de Auth/Login

*** Variables ***
${baseURL}        https://ron-bugado.qacoders.dev.br


*** Keywords ***

Login Com Sucesso
 # Este teste verifica o login com sucesso usando credenciais válidas
    Create Session     NewSession    ${baseURL}    verify=true
    ${expectativa_msg}    Set Variable    Olá Qa-Coders-SYSADMIN, autenticação autorizada com sucesso!
    ${headers}=        Create Dictionary    
    ...    accept=application/json    
    ...    Content-Type=application/json
    ${body}=           Create Dictionary    
    ...    mail=sysadmin@qacoders.com
    ...    password=1234@Test
    ${response}=       Post Request    NewSession    /api/login    json=${body}    headers=${headers}
    Log    ${response.json()}
 # Valida se o status code retornado é igual ao esperado
    Should Be Equal As Numbers    ${response.status_code}    200
 # Valida se a msg de SUCESSO do response é igual a msg que é esperada
    ${msg}=          Set Variable    ${response.json()['msg']}
    Should Be Equal     ${msg}    ${expectativa_msg}
 # Armazenar o token retornado e exibe o token
    ${token}=    Set Variable    ${response.json()['token']}
    Log    ${token}


Login Incorreto
 #Este teste verifica o comportamento do login ao incerrir credências incorretas
    [Arguments]    ${mail}    ${password}
    Create Session     NewSession    ${baseURL}    verify=true
    ${expectativa_alert}    Set Variable    Os dados informados são inválidos
    ${headers}=        Create Dictionary    
    ...    accept=application/json    
    ...    Content-Type=application/json
    ${body}=           Create Dictionary    
    ...    mail=${mail}
    ...    password=${password}
    ${response}=       Post Request    NewSession    /api/login    json=${body}    headers=${headers}
    Log    ${response.json()}
 # Valida se o status code retornado é igual ao esperado
    Should Be Equal As Numbers    ${response.status_code}    400
 # Valida se a msg de ERRO do response é igual a msg que é esperada
    ${alert}=          Set Variable    ${response.json()['alert'][0]}
    Should Be Equal     ${alert}    ${expectativa_alert}