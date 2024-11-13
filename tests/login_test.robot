*** Settings ***
Resource    ../resources/login_keywords.robot
Documentation    Tests Cases para validar os endpoints relacionaos ao LOGIN da feature de Auth/Login

*** Test Cases ***
Validar Login Admin Com Sucesso
    #Este teste verifica o login com sucesso usando credenciais válidas
    Login Com Sucesso

Validar Login Admin com E-MAIL "Vazio"
    #Este teste verifica o comportamento do login com o campo "mail" vazio
    Login Incorreto    ' '    1234@Test

Validar Login Admin com E-MAIL "Null"
    #Este teste verifica o comportamento do login com o campo "mail" null
    Login Incorreto    null    1234@Test

Validar Login Admin com E-MAIL Inválido
    #Este teste verifica o comportamento do login com o campo "mail" inválido
    Login Incorreto    teste_email_invalido_123    1234@Test

Validar Login Admin com SENHA "Vazia"
    #Este teste verifica o comportamento do login com o campo "senha" vazio
    Login Incorreto    sysadmin@qacoders.com    ' '

Validar Login Admin com SENHA "Null"
    #Este teste verifica o comportamento do login com o campo "senha" null
    Login Incorreto    sysadmin@qacoders.com    null

Validar Login Admin com SENHA Inválida
    #Este teste verifica o comportamento do login com o campo "senha" inválida
    Login Incorreto    sysadmin@qacoders.com    senha_teste_invalida_123



#robot -d ./results .\tests\login_test.robot