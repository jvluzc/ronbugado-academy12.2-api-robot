*** Settings ***
Resource    ../resources/login_keywords.robot
Resource    ../resources/company_keywords.robot
Resource    ../resources/randomicos_keywords.robot
Documentation    Tests Cases para validar os endpoints relacionaos a feature de Company

*** Test Cases ***

# Teste usando a keyword com parâmetros
Criação de Nova Empresa
#robot -d ./results .\tests\company_NovaEmpresa.robot
    ${corporate_Name}=     Gerar Nome Empresa
    ${register_Company}=   Gerar Numero 14 Digitos
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Criar Nova Empresa    
    ...    ${corporate_Name}    
    ...    ${register_Company}    
    ...    test@test.com    
    ...    ${matriz}    
    ...    Marcio    
    ...    99999999999999    
    ...    Testes
    #Address    
    ...    04777001    Sao Paulo    SP    Rua das Flores    Avenida Interlagos    50    de 4503 ao fim - lado impar    Brasil

