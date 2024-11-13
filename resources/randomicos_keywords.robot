*** Settings ***
Resource    resource.robot

Documentation    Keywords para criar dados randomicos para utilziação em Testes


*** Keywords ***
Gerar Nome Empresa
    ${random_string}=    Generate Random String    10    [LOWER][NUMBERS]
    ${nome_empresa}=     Set Variable    EMPRESA ${random_string} LTDA
    [Return]    ${nome_empresa}

Gerar Numero 14 Digitos
    ${random_number}=    Generate Random String    14    [NUMBERS]
    [Return]    ${random_number}

Gerar Valor Alfanumerico 14 caracteres
    ${random_string}=    Generate Random String    14    [LOWER][NUMBERS]
    [Return]    ${random_string}