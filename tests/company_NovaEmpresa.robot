*** Settings ***
Resource    ../resources/login_keywords.robot
Resource    ../resources/company_keywords.robot
Resource    ../resources/randomicos_keywords.robot
Documentation    Tests Cases para validar os endpoints relacionaos a feature de Company

*** Test Cases ***

# Teste usando a keyword com parâmetros
[CT01] - Criação de Nova Empresa (caminho feliz)
#robot -d ./results .\tests\company_NovaEmpresa.robot
    ${corporate_Name}=     Gerar Nome Empresa
    ${register_Company}=   Gerar Numero 14 Digitos
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Criar Nova Empresa    
    # dados
    ...    ${corporate_Name}    
    ...    ${register_Company}    
    ...    test@test.com    
    ...    ${matriz}    
    ...    Marcio    
    ...    99999999999999    
    ...    Testes
    #Address    
    ...    04777001    Sao Paulo    SP    Rua das Flores    Avenida Interlagos    50    de 4503 ao fim - lado impar    Brasil
    # expectativa de retorno do status code
    ...    201


[CT02] - Enviar empresa com CNPJ (registerCompany) vazio (Campo Obrigatório)
#robot -d ./results .\tests\company_NovaEmpresa.robot
    ${corporate_Name}=     Gerar Nome Empresa
    ${register_Company}=   Gerar Numero 14 Digitos
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Criar Nova Empresa    
    # dados
    ...    ${corporate_Name}    
    ...        
    ...    test@test.com    
    ...    ${matriz}    
    ...    Marcio    
    ...    99999999999999    
    ...    Testes
    #Address    
    ...    04777001    Sao Paulo    SP    Rua das Flores    Avenida Interlagos    50    de 4503 ao fim - lado impar    Brasil
    # expectativa de retorno do status code
    ...    400


[CT03] - Enviar empresa com CNPJ (registerCompany) com MAIS de 14 caracteres
#robot -d ./results .\tests\company_NovaEmpresa.robot
    ${corporate_Name}=     Gerar Nome Empresa
    ${register_Company}=   Gerar Numero 14 Digitos
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Criar Nova Empresa    
    # dados
    ...    ${corporate_Name}    
    ...    1234567890123456    
    ...    test@test.com    
    ...    ${matriz}    
    ...    Marcio    
    ...    99999999999999    
    ...    Testes
    #Address    
    ...    04777001    Sao Paulo    SP    Rua das Flores    Avenida Interlagos    50    de 4503 ao fim - lado impar    Brasil
    # expectativa de retorno do status code
    ...    400


[CT04] - Enviar empresa com NOME (corporateName) com MAIS de 100 caracteres
#robot -d ./results .\tests\company_NovaEmpresa.robot
    ${corporate_Name}=     Gerar Nome Empresa
    ${register_Company}=   Gerar Numero 14 Digitos
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Criar Nova Empresa    
    # dados
    ...    AbcdefghijAbcdefghijAbcdefghijAbcdefghijAbcdefghijAbcdefghijAbcdefghijAbcdefghijAbcdefghijAbcdefghijA
    ...    ${register_Company}    
    ...    test@test.com    
    ...    ${matriz}    
    ...    Marcio    
    ...    99999999999999    
    ...    Testes
    #Address    
    ...    04777001    Sao Paulo    SP    Rua das Flores    Avenida Interlagos    50    de 4503 ao fim - lado impar    Brasil
    # expectativa de retorno do status code
    ...    400


[CT05] - Enviar empresa com RAZÃO SOCIAL (Matriz) com MAIS de 100 caracteres
#robot -d ./results .\tests\company_NovaEmpresa.robot
    ${corporate_Name}=     Gerar Nome Empresa
    ${register_Company}=   Gerar Numero 14 Digitos
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Criar Nova Empresa    
    # dados
    ...    ${corporate_Name}    
    ...    ${register_Company}    
    ...    test@test.com    
    ...    AbcdefghijAbcdefghijAbcdefghijAbcdefghijAbcdefghijAbcdefghijAbcdefghijAbcdefghijAbcdefghijAbcdefghijA   
    ...    Marcio    
    ...    99999999999999    
    ...    Testes
    #Address    
    ...    04777001    Sao Paulo    SP    Rua das Flores    Avenida Interlagos    50    de 4503 ao fim - lado impar    Brasil
    # expectativa de retorno do status code
    ...    400


[CT06] - Enviar empresa com RAZÃO SOCIAL (Matriz) vazio (Campo Obrigatório)
#robot -d ./results .\tests\company_NovaEmpresa.robot
    ${corporate_Name}=     Gerar Nome Empresa
    ${register_Company}=   Gerar Numero 14 Digitos
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Criar Nova Empresa    
    # dados
    ...    ${corporate_Name}    
    ...    ${register_Company}    
    ...    test@test.com    
    ...    
    ...    Marcio    
    ...    99999999999999    
    ...    Testes
    #Address    
    ...    04777001    Sao Paulo    SP    Rua das Flores    Avenida Interlagos    50    de 4503 ao fim - lado impar    Brasil
    # expectativa de retorno do status code
    ...    400



[CT 07] - Enviar empresa com CONTATO RESPONSÁVEL (responsibleContact) com MAIS de 100 caracteres
#robot -d ./results .\tests\company_NovaEmpresa.robot
    ${corporate_Name}=     Gerar Nome Empresa
    ${register_Company}=   Gerar Numero 14 Digitos
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Criar Nova Empresa    
    # dados
    ...    ${corporate_Name}    
    ...    ${register_Company}    
    ...    test@test.com    
    ...    AbcdefghijAbcdefghijAbcdefghijAbcdefghijAbcdefghijAbcdefghijAbcdefghijAbcdefghijAbcdefghijAbcdefghijA     
    ...    Marcio    
    ...    99999999999999    
    ...    Testes
    #Address    
    ...    04777001    Sao Paulo    SP    Rua das Flores    Avenida Interlagos    50    de 4503 ao fim - lado impar    Brasil
    # expectativa de retorno do status code
    ...    400
    


[CT 08] - Enviar empresa com TELEFONE (telephone) vazio (Campo Obrigatório)
#robot -d ./results .\tests\company_NovaEmpresa.robot
    ${corporate_Name}=     Gerar Nome Empresa
    ${register_Company}=   Gerar Numero 14 Digitos
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Criar Nova Empresa    
    # dados
    ...    ${corporate_Name}    
    ...    ${register_Company}    
    ...    test@test.com    
    ...    ${matriz}    
    ...    Marcio    
    ...     
    ...    Testes
    #Address    
    ...    04777001    Sao Paulo    SP    Rua das Flores    Avenida Interlagos    50    de 4503 ao fim - lado impar    Brasil
    # expectativa de retorno do status code
    ...    400


[CT 09] - Enviar empresa com TELEFONE (telephone) contendo caracteres inválidos (Especiais)
#robot -d ./results .\tests\company_NovaEmpresa.robot
    ${corporate_Name}=     Gerar Nome Empresa
    ${register_Company}=   Gerar Numero 14 Digitos
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Criar Nova Empresa    
    # dados
    ...    ${corporate_Name}    
    ...    ${register_Company}    
    ...    test@test.com    
    ...    ${matriz}    
    ...    Marcio    
    ...    @#$%%   
    ...    Testes
    #Address    
    ...    04777001    Sao Paulo    SP    Rua das Flores    Avenida Interlagos    50    de 4503 ao fim - lado impar    Brasil
    # expectativa de retorno do status code
    ...    400


[CT 10] - Enviar empresa com E-MAIL (mail) formato inválido Ex: sem parte local - @gmail.com
#robot -d ./results .\tests\company_NovaEmpresa.robot
    ${corporate_Name}=     Gerar Nome Empresa
    ${register_Company}=   Gerar Numero 14 Digitos
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Criar Nova Empresa    
    # dados
    ...    ${corporate_Name}    
    ...    ${register_Company}    
    ...    test.....teste.com    
    ...    ${matriz}    
    ...    Marcio    
    ...    99999999999999    
    ...    Testes
    #Address    
    ...    04777001    Sao Paulo    SP    Rua das Flores    Avenida Interlagos    50    de 4503 ao fim - lado impar    Brasil
    # expectativa de retorno do status code
    ...    400

[CT 11] - Enviar empresa com E-MAIL (mail) vazio (Campo Obrigatório)
#robot -d ./results .\tests\company_NovaEmpresa.robot
    ${corporate_Name}=     Gerar Nome Empresa
    ${register_Company}=   Gerar Numero 14 Digitos
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Criar Nova Empresa    
    # dados
    ...    ${corporate_Name}    
    ...    ${register_Company}    
    ...        
    ...    ${matriz}    
    ...    Marcio    
    ...    99999999999999    
    ...    Testes
    #Address    
    ...    04777001    Sao Paulo    SP    Rua das Flores    Avenida Interlagos    50    de 4503 ao fim - lado impar    Brasil
    # expectativa de retorno do status code
    ...    400


[CT 12] - Enviar empresa com DESCRIÇÃO (serviceDescription) vazio (Campo Obrigatório)
#robot -d ./results .\tests\company_NovaEmpresa.robot
    ${corporate_Name}=     Gerar Nome Empresa
    ${register_Company}=   Gerar Numero 14 Digitos
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Criar Nova Empresa    
    # dados
    ...    ${corporate_Name}    
    ...    ${register_Company}    
    ...    test@test.com    
    ...    ${matriz}    
    ...    Marcio    
    ...    99999999999999    
    ...    
    #Address    
    ...    04777001    Sao Paulo    SP    Rua das Flores    Avenida Interlagos    50    de 4503 ao fim - lado impar    Brasil
    # expectativa de retorno do status code
    ...    400
[CT 13] - Enviar empresa com LOGRADOURO (streeet) vazio (Campo Obrigatório)
#robot -d ./results .\tests\company_NovaEmpresa.robot
    ${corporate_Name}=     Gerar Nome Empresa
    ${register_Company}=   Gerar Numero 14 Digitos
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Criar Nova Empresa    
    # dados
    ...    ${corporate_Name}    
    ...    ${register_Company}    
    ...    test@test.com    
    ...    ${matriz}    
    ...    Marcio    
    ...    99999999999999    
    ...    Testes
    #Address    
    ...    04777001    Sao Paulo    SP    Rua das Flores    
    ...       
    ...    50    de 4503 ao fim - lado impar    Brasil
    # expectativa de retorno do status code
    ...    400

[CT 14] - Enviar empresa com LOGRADOURO (streeet) contendo caracteres inválidos (Especiais)
#robot -d ./results .\tests\company_NovaEmpresa.robot
    ${corporate_Name}=     Gerar Nome Empresa
    ${register_Company}=   Gerar Numero 14 Digitos
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Criar Nova Empresa    
    # dados
    ...    ${corporate_Name}    
    ...    ${register_Company}    
    ...    test@test.com    
    ...    ${matriz}    
    ...    Marcio    
    ...    99999999999999    
    ...    Testes
    #Address    
    ...    04777001    Sao Paulo    SP    Rua das Flores    %$#$    50    de 4503 ao fim - lado impar    Brasil
    # expectativa de retorno do status code
    ...    400


[CT 15] - Enviar empresa com campo NÚMERO (number) vazio (Campo Obrigatório)
#robot -d ./results .\tests\company_NovaEmpresa.robot
    ${corporate_Name}=     Gerar Nome Empresa
    ${register_Company}=   Gerar Numero 14 Digitos
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Criar Nova Empresa    
    # dados
    ...    ${corporate_Name}    
    ...    ${register_Company}    
    ...    test@test.com    
    ...    ${matriz}    
    ...    Marcio    
    ...    99999999999999    
    ...    Testes
    #Address    
    ...    04777001    Sao Paulo    SP    Rua das Flores    Avenida Interlagos    
    ...    
    ...    de 4503 ao fim - lado impar    Brasil
    # expectativa de retorno do status code
    ...    400

[CT 16] - Enviar empresa com campo NÚMERO (number) contendo MAIS DE 10 caracteres
#robot -d ./results .\tests\company_NovaEmpresa.robot
    ${corporate_Name}=     Gerar Nome Empresa
    ${register_Company}=   Gerar Numero 14 Digitos
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Criar Nova Empresa    
    # dados
    ...    ${corporate_Name}    
    ...    ${register_Company}    
    ...    test@test.com    
    ...    ${matriz}    
    ...    Marcio    
    ...    99999999999999    
    ...    Testes
    #Address    
    ...    04777001    Sao Paulo    SP    Rua das Flores    Avenida Interlagos    012345678912    de 4503 ao fim - lado impar    Brasil
    # expectativa de retorno do status code
    ...    400

[CT 17] - Enviar empresa com campo COMPLEMENTO (complement) contendo caracteres inválidos (Especiais)
#robot -d ./results .\tests\company_NovaEmpresa.robot
    ${corporate_Name}=     Gerar Nome Empresa
    ${register_Company}=   Gerar Numero 14 Digitos
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Criar Nova Empresa    
    # dados
    ...    ${corporate_Name}    
    ...    ${register_Company}    
    ...    test@test.com    
    ...    ${matriz}    
    ...    Marcio    
    ...    99999999999999    
    ...    Testes
    #Address    
    ...    04777001    Sao Paulo    SP    Rua das Flores    Avenida Interlagos    50    $#@$$#    Brasil
    # expectativa de retorno do status code
    ...    400

[CT 18] - Enviar empresa com campo COMPLEMENTO (complement) contendo MAIS DE 80 caracteres
#robot -d ./results .\tests\company_NovaEmpresa.robot
    ${corporate_Name}=     Gerar Nome Empresa
    ${register_Company}=   Gerar Numero 14 Digitos
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Criar Nova Empresa    
    # dados
    ...    ${corporate_Name}    
    ...    ${register_Company}    
    ...    test@test.com    
    ...    ${matriz}    
    ...    Marcio    
    ...    99999999999999    
    ...    Testes
    #Address    
    ...    04777001    Sao Paulo    SP    Rua das Flores    Avenida Interlagos    50    abcdefghiJabcdefghiJabcdefghiJabcdefghiJabcdefghiJabcdefghiJabcdefghiJabcdefghiJaa    Brasil
    # expectativa de retorno do status code
    ...    400

[CT 19] - Enviar empresa com campo BAIRRO (district) vazio (Campo Obrigatório)
#robot -d ./results .\tests\company_NovaEmpresa.robot
    ${corporate_Name}=     Gerar Nome Empresa
    ${register_Company}=   Gerar Numero 14 Digitos
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Criar Nova Empresa    
    # dados
    ...    ${corporate_Name}    
    ...    ${register_Company}    
    ...    test@test.com    
    ...    ${matriz}    
    ...    Marcio    
    ...    99999999999999    
    ...    Testes
    #Address    
    ...    04777001    Sao Paulo    SP    
    ...    
    ...    Avenida Interlagos    50    de 4503 ao fim - lado impar    Brasil
    # expectativa de retorno do status code
    ...    400

[CT 20] - Enviar empresa com campo BAIRRO (district) contendo caracteres inválidos (Especiais)
#robot -d ./results .\tests\company_NovaEmpresa.robot
    ${corporate_Name}=     Gerar Nome Empresa
    ${register_Company}=   Gerar Numero 14 Digitos
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Criar Nova Empresa    
    # dados
    ...    ${corporate_Name}    
    ...    ${register_Company}    
    ...    test@test.com    
    ...    ${matriz}    
    ...    Marcio    
    ...    99999999999999    
    ...    Testes
    #Address    
    ...    04777001    Sao Paulo    SP    5$#@$#@#    Avenida Interlagos    50    de 4503 ao fim - lado impar    Brasil
    # expectativa de retorno do status code
    ...    400

[CT 21] - Enviar empresa com campo CIDADE (city) vazio (Campo Obrigatório)
#robot -d ./results .\tests\company_NovaEmpresa.robot
    ${corporate_Name}=     Gerar Nome Empresa
    ${register_Company}=   Gerar Numero 14 Digitos
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Criar Nova Empresa    
    # dados
    ...    ${corporate_Name}    
    ...    ${register_Company}    
    ...    test@test.com    
    ...    ${matriz}    
    ...    Marcio    
    ...    99999999999999    
    ...    Testes
    #Address    
    ...    04777001    
    ...    
    ...    SP    Rua das Flores    Avenida Interlagos    50    de 4503 ao fim - lado impar    Brasil
    # expectativa de retorno do status code
    ...    400

[CT 22] - Enviar empresa com campo CIDADE (city) contendo caracteres inválidos (Especiais)
#robot -d ./results .\tests\company_NovaEmpresa.robot
    ${corporate_Name}=     Gerar Nome Empresa
    ${register_Company}=   Gerar Numero 14 Digitos
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Criar Nova Empresa    
    # dados
    ...    ${corporate_Name}    
    ...    ${register_Company}    
    ...    test@test.com    
    ...    ${matriz}    
    ...    Marcio    
    ...    99999999999999    
    ...    Testes
    #Address    
    ...    04777001    %$@#$$#    SP    Rua das Flores    Avenida Interlagos    50    de 4503 ao fim - lado impar    Brasil
    # expectativa de retorno do status code
    ...    400

[CT 23] - Enviar empresa com campo ESTADO (state) contendo caracteres inválidos (Numeros)
#robot -d ./results .\tests\company_NovaEmpresa.robot
    ${corporate_Name}=     Gerar Nome Empresa
    ${register_Company}=   Gerar Numero 14 Digitos
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Criar Nova Empresa    
    # dados
    ...    ${corporate_Name}    
    ...    ${register_Company}    
    ...    test@test.com    
    ...    ${matriz}    
    ...    Marcio    
    ...    99999999999999    
    ...    Testes
    #Address    
    ...    04777001    Sao Paulo    16    Rua das Flores    Avenida Interlagos    50    de 4503 ao fim - lado impar    Brasil
    # expectativa de retorno do status code
    ...    400

[CT 24] - Enviar empresa com campo ESTADO (state) contendo MAIS DE 2 caracteres
#robot -d ./results .\tests\company_NovaEmpresa.robot
    ${corporate_Name}=     Gerar Nome Empresa
    ${register_Company}=   Gerar Numero 14 Digitos
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Criar Nova Empresa    
    # dados
    ...    ${corporate_Name}    
    ...    ${register_Company}    
    ...    test@test.com    
    ...    ${matriz}    
    ...    Marcio    
    ...    99999999999999    
    ...    Testes
    #Address    
    ...    04777001    Sao Paulo    SPEE    Rua das Flores    Avenida Interlagos    50    de 4503 ao fim - lado impar    Brasil
    # expectativa de retorno do status code
    ...    400


[CT 25] - Enviar empresa com campo CEP (zipCode) vazio (Campo Obrigatório)
#robot -d ./results .\tests\company_NovaEmpresa.robot
    ${corporate_Name}=     Gerar Nome Empresa
    ${register_Company}=   Gerar Numero 14 Digitos
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Criar Nova Empresa    
    # dados
    ...    ${corporate_Name}    
    ...    ${register_Company}    
    ...    test@test.com    
    ...    ${matriz}    
    ...    Marcio    
    ...    99999999999999    
    ...    Testes
    #Address    
    ...    
    ...    Sao Paulo    SP    Rua das Flores    Avenida Interlagos    50    de 4503 ao fim - lado impar    Brasil
    # expectativa de retorno do status code
    ...    400


[CT 26] - Enviar empresa com campo CEP (zipCode) contendo caracteres inválidos (Letras)
#robot -d ./results .\tests\company_NovaEmpresa.robot
    ${corporate_Name}=     Gerar Nome Empresa
    ${register_Company}=   Gerar Numero 14 Digitos
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Criar Nova Empresa    
    # dados
    ...    ${corporate_Name}    
    ...    ${register_Company}    
    ...    test@test.com    
    ...    ${matriz}    
    ...    Marcio    
    ...    99999999999999    
    ...    Testes
    #Address    
    ...    HFDSGH    Sao Paulo    SP    Rua das Flores    Avenida Interlagos    50    de 4503 ao fim - lado impar    Brasil
    # expectativa de retorno do status code
    ...    400