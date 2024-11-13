*** Settings ***
Resource    resource.robot
Resource    ../resources/login_keywords.robot

Documentation    Keywords para testar a feature de Company

*** Variables ***
${baseURL}        https://ron-bugado.qacoders.dev.br
${TOKEN}          # Variável global para armazenar o token gerado

**** Keywords ****

# Teste de Login para obter e armazenar o token
Login E Armazenar Token
 #Este teste faz login e armazena o token globalmente
    Create Session     NewSession    ${baseURL}    verify=true
    ${headers}=        Create Dictionary    
    ...    accept=application/json    
    ...    Content-Type=application/json
    ${body}=           Create Dictionary    
    ...    mail=sysadmin@qacoders.com
    ...    password=1234@Test
    ${response}=       Post Request    NewSession    /api/login    json=${body}    headers=${headers}
    Log    ${response.json()}

    # Valida o status code
    Should Be Equal As Numbers    ${response.status_code}    200

    # Armazena o token globalmente
    Set Global Variable    ${TOKEN}    ${response.json()['token']}
    Log    ${TOKEN}


#Este teste cria uma nova empresa utilizando o token obtido no login
Criar Nova Empresa
    [Arguments]    
    ...    ${corporateName}    
    ...    ${registerCompany}    
    ...    ${mail}    
    ...    ${matriz}    
    ...    ${responsibleContact}    
    ...    ${telephone}    
    ...    ${serviceDescription}
    #address:   
    ...    ${zipCode}    ${city}    ${state}    ${district}    ${street}    ${number}    ${complement}    ${country}
    
    # Faz o Login Admin e armazemna o token gerado
    Login E Armazenar Token
    
    # Define os cabeçalhos com o token de autorização
    Create Session     NewSession    ${baseURL}    verify=true
    ${headers}=    Create Dictionary    
    ...    accept=application/json    
    ...    Content-Type=application/json
    ...    Authorization=${TOKEN}

    # Cria o endereço como um dicionário dentro de uma lista
    ${address}=    Create List
    ${address_dict}=    Create Dictionary    
    ...    zipCode=${zipCode}    
    ...    city=${city}    
    ...    state=${state}    
    ...    district=${district}    
    ...    street=${street}    
    ...    number=${number}    
    ...    complement=${complement}    
    ...    country=${country}
    Append To List    ${address}    ${address_dict}

    # Cria o corpo da requisição com os dados da nova empresa
    ${body}=    Create Dictionary
    ...    corporateName=${corporateName}
    ...    registerCompany=${registerCompany}
    ...    mail=${mail}
    ...    matriz=${matriz}
    ...    responsibleContact=${responsibleContact}
    ...    telephone=${telephone}
    ...    serviceDescription=${serviceDescription}
    ...    address=${address}

    # Faz a requisição POST para criar a empresa
    ${response}=    Post Request    NewSession    /api/company/    json=${body}    headers=${headers}
    Log    ${response.json()}

    # Valida o status code
    Should Be Equal As Numbers    ${response.status_code}    201

    # Opcional: Validar os dados retornados na resposta
    #${corporateName}=    Set Variable    ${response.json()['corporateName']}
    #Should Be Equal     ${corporateName}    bshdjvjdadavhjdvjdsaj

Editar Empresa Cadastrada
    [Arguments]    
    ...    ${corporateName}    
    ...    ${registerCompany}    
    ...    ${mail}    
    ...    ${matriz}    
    ...    ${responsibleContact}    
    ...    ${telephone}    
    ...    ${serviceDescription}
    
    # Faz o Login Admin e armazemna o token gerado
    Login E Armazenar Token
    
    # Define os cabeçalhos com o token de autorização
    Create Session     NewSession    ${baseURL}    verify=true
    ${headers}=    Create Dictionary    
    ...    accept=application/json    
    ...    Content-Type=application/json
    ...    Authorization=${TOKEN}

    # Cria o corpo da requisição com os dados da nova empresa
    ${body}=    Create Dictionary
    ...    corporateName=${corporateName}
    ...    registerCompany=${registerCompany}
    ...    mail=${mail}
    ...    matriz=${matriz}
    ...    responsibleContact=${responsibleContact}
    ...    telephone=${telephone}
    ...    serviceDescription=${serviceDescription}

    # Faz a requisição POST para criar a empresa
    ${response}=    Put Request    NewSession    /api/company/67099927eed30dc911c58099    json=${body}    headers=${headers}
    Log    ${response.json()}
    
    ${msg}=    Set Variable    ${response.json()['msg']}
    Should Be Equal     ${msg}    Companhia atualizada com sucesso.

Editar Endereco Empresa
    [Arguments]    
    #address:   
    ...    ${zipCode}    ${city}    ${state}    ${district}    ${street}    ${number}    ${complement}    ${country}
    
    # Faz o Login Admin e armazemna o token gerado
    Login E Armazenar Token
    
    # Define os cabeçalhos com o token de autorização
    Create Session     NewSession    ${baseURL}    verify=true
    ${headers}=    Create Dictionary    
    ...    accept=application/json    
    ...    Content-Type=application/json
    ...    Authorization=${TOKEN}

    # Cria o endereço como um dicionário dentro de uma lista
    ${address}=    Create List
    ${address_dict}=    Create Dictionary    
    ...    zipCode=${zipCode}    
    ...    city=${city}    
    ...    state=${state}    
    ...    district=${district}    
    ...    street=${street}    
    ...    number=${number}    
    ...    complement=${complement}    
    ...    country=${country}
    Append To List    ${address}    ${address_dict}

    # Cria o corpo da requisição com os dados da nova empresa
    ${body}=    Create Dictionary
    ...    address=${address}

    # Faz a requisição POST para criar a empresa
    ${response}=    Put Request    NewSession    /api/company/address/67099960eed30dc911c580a0    json=${body}    headers=${headers}
    Log    ${response.json()}

    # Valida o status code
    Should Be Equal As Numbers    ${response.status_code}    201