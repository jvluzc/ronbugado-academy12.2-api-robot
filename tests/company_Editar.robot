*** Settings ***
Resource    ../resources/login_keywords.robot
Resource    ../resources/company_keywords.robot
Resource    ../resources/randomicos_keywords.robot
Documentation    Tests Cases para validar a PBI de "Editar Cadastro de Empresa": feature de "Company".

*** Test Cases ***
# comando rodar os testes: robot -d ./results .\tests\company_EditarEmpresa.robot

Editar Cadastro de Empresa Com Sucesso
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    ${corporate_Name}
    ...    12126456000155
    ...    test@test.com
    ...    ${matriz}
    ...    Marcio
    ...    99999999999999
    ...    Testes

[CT01] Buscar empresa para edição dos dados da empresa e validar se os campos obrigatórios já estão preenchidos
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    ${corporate_Name}
    ...    12126456000155
    ...    test@test.com
    ...    ${matriz}
    ...    Marcio
    ...    99999999999999
    ...    Testes

[CT02] Editar todos os dados de empresa já cadastrada no sistema com dados válidos e enviar com sucesso (Caminho Feliz)
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Edicao gxsgsf Teste
    ...    12126456000155
    ...    test@testjoao.com.br
    ...    ${matriz}
    ...    JoaoTeste
    ...    11111111111
    ...    EdicaoTeste

[CT03] Editar campo NOME da empresa (corporateName) com caracteres válidos (Alfanuméricos)
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Edicao 123abcDD alfanumérica
    ...    12126456000155
    ...    test@testjoao.com.br
    ...    ${matriz}
    ...    JoaoTeste
    ...    11111111111
    ...    EdicaoTeste

[CT04] Editar campo NOME da empresa (corporateName) com caracteres inválidos (Especiais)
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Edicao %$#$&¨%
    ...    12126456000155
    ...    test@testjoao.com.br
    ...    ${matriz}
    ...    JoaoTeste
    ...    11111111111
    ...    EdicaoTeste

[CT05] Editar campo NOME (corporateName) da empresa enviando com o campo vazio (Campo Obrigatório)
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    
    ...    12126456000155
    ...    test@testjoao.com.br
    ...    ${matriz}
    ...    JoaoTeste
    ...    11111111111
    ...    EdicaoTeste

[CT06] Editar campo NOME da empresa (corporateName) enviando com o campo nulo (Campo Obrigatório)
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    null
    ...    12126456000155
    ...    test@testjoao.com.br
    ...    ${matriz}
    ...    JoaoTeste
    ...    11111111111
    ...    EdicaoTeste

[CT07] Editar campo NOME da empresa (corporateName) para o nome de outra empresa já cadastrado no sistema
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Teste do Teste
    ...    12126456000155
    ...    test@testjoao.com.br
    ...    ${matriz}
    ...    JoaoTeste
    ...    11111111111
    ...    EdicaoTeste

[CT08] Editar campo NOME da empresa (corporateName) para MENOS de 100 caracteres
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghi
    ...    12126456000155
    ...    test@testjoao.com.br
    ...    ${matriz}
    ...    JoaoTeste
    ...    11111111111
    ...    EdicaoTeste

[CT09] Editar campo NOME da empresa (corporateName) para MAIS de 100 caracteres
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghiji
    ...    12126456000155
    ...    test@testjoao.com.br
    ...    ${matriz}
    ...    JoaoTeste
    ...    11111111111
    ...    EdicaoTeste

[CT18] Editar campo RAZÃO SOCIAL da empresa (Matriz) enviando com o campo vazio (Campo Obrigatório)
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Empresa hshsgs LTDA
    ...    12126456000155
    ...    test@testjoao.com.br
    ...    
    ...    JoaoTeste
    ...    11111111111
    ...    EdicaoTeste

[CT19] Editar campo RAZÃO SOCIAL da empresa (Matriz) enviando com o campo nulo (Campo Obrigatório)
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Empresa hshsgs LTDA
    ...    12126456000155
    ...    test@testjoao.com.br
    ...    null
    ...    JoaoTeste
    ...    11111111111
    ...    EdicaoTeste

[CT20] Editar campo RAZÃO SOCIAL da empresa (Matriz) com caracteres válidos (Alfanuméricos)

    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Empresa hshsgs LTDA
    ...    12126456000155
    ...    test@testjoao.com.br
    ...    TESTE123987teste
    ...    JoaoTeste
    ...    11111111111
    ...    EdicaoTeste

[CT21] Editar campo RAZÃO SOCIAL da empresa (Matriz) com caracteres inválidos (Especiais)

    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Empresa hshsgs LTDA
    ...    12126456000155
    ...    test@testjoao.com.br
    ...    %$#&%@
    ...    JoaoTeste
    ...    11111111111
    ...    EdicaoTeste
[CT22] Editar campo RAZÃO SOCIAL da empresa (Matriz) com a RAZÃO SOCIAL de outra empresa já cadastrado no sistema

    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Empresa hshsgs LTDA
    ...    12126456000155
    ...    test@testjoao.com.br
    ...    Teste
    ...    JoaoTeste
    ...    11111111111
    ...    EdicaoTeste

[CT23] Editar campo RAZÃO SOCIAL (Matriz) com MENOS de 100 caracteres

    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Empresa hshsgs LTDA
    ...    12126456000155
    ...    test@testjoao.com.br
    ...    abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghi
    ...    JoaoTeste
    ...    11111111111
    ...    EdicaoTeste

[CT24] Editar campo RAZÃO SOCIAL (Matriz) com MAIS de 100 caracteres
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Empresa hshsgs LTDA
    ...    12126456000155
    ...    test@testjoao.com.br
    ...    abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghija
    ...    JoaoTeste
    ...    11111111111
    ...    EdicaoTeste

[CT25] Editar campo CONTATO RESPONSÁVEL da empresa (responsibleContact) enviando com o campo vazio (Campo Obrigatório)
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Empresa hshsgs LTDA
    ...    12126456000155
    ...    test@testjoao.com.br
    ...    abcdefghija
    ...    
    ...    11111111111
    ...    EdicaoTeste

[CT26] Editar campo CONTATO RESPONSÁVEL da empresa (responsibleContact) enviando com o campo nulo (Campo Obrigatório)
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Empresa hshsgs LTDA
    ...    12126456000155
    ...    test@testjoao.com.br
    ...    abcdefghija
    ...    null
    ...    11111111111
    ...    EdicaoTeste

[CT27] Editar campo CONTATO RESPONSÁVEL da empresa (responsibleContact) com caracteres válidos (Letras)
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Empresa hshsgs LTDA
    ...    12126456000155
    ...    test@testjoao.com.br
    ...    abcdefghija
    ...    abcDEFGhiJ
    ...    11111111111
    ...    EdicaoTeste

[CT28] Editar campo CONTATO RESPONSÁVEL da empresa (responsibleContact) com caracteres inválidos (Especiais)
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Empresa hshsgs LTDA
    ...    12126456000155
    ...    test@testjoao.com.br
    ...    abcdefghija
    ...    *&¨%$#@!!!*
    ...    11111111111
    ...    EdicaoTeste

[CT29] Editar campo CONTATO RESPONSÁVEL da empresa (responsibleContact) com caracteres inválidos (Numéricos)
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Empresa hshsgs LTDA
    ...    12126456000155
    ...    test@testjoao.com.br
    ...    abcdefghija
    ...    12345678
    ...    11111111111
    ...    EdicaoTeste

[CT30] Editar campo CONTATO RESPONSÁVEL da empresa (responsibleContact) para MENOS de 100 caracteres
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Empresa hshsgs LTDA
    ...    12126456000155
    ...    test@testjoao.com.br
    ...    abcdefghija
    ...    abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghi
    ...    11111111111
    ...    EdicaoTeste

[CT31] Editar campo CONTATO RESPONSÁVEL da empresa (responsibleContact) para MAIS de 100 caracteres
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Empresa hshsgs LTDA
    ...    12126456000155
    ...    test@testjoao.com.br
    ...    abcdefghija
    ...    abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghija
    ...    11111111111
    ...    EdicaoTeste

[CT32] Editar campo CONTATO RESPONSÁVEL da empresa (responsibleContact) com MENOS de 2 palavras compostas
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Empresa hshsgs LTDA
    ...    12126456000155
    ...    test@testjoao.com.br
    ...    abcdefghija
    ...    teste
    ...    11111111111
    ...    EdicaoTeste

[CT33] Editar campo CONTATO RESPONSÁVEL da empresa (responsibleContact) com MAIS de 2 palavras compostas
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Empresa hshsgs LTDA
    ...    12126456000155
    ...    test@testjoao.com.br
    ...    abcdefghija
    ...    teste composto tres
    ...    11111111111
    ...    EdicaoTeste

[CT34] Editar campo TELEFONE da empresa (telephone) vazio (Campo Obrigatório)
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Empresa hshsgs LTDA
    ...    12126456000155
    ...    test@testjoao.com.br
    ...    abcdefghija
    ...    teste composto tres
    ...    
    ...    EdicaoTeste

[CT35] Editar campo TELEFONE da empresa (telephone) nulo (Campo Obrigatório)
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Empresa hshsgs LTDA
    ...    12126456000155
    ...    test@testjoao.com.br
    ...    abcdefghija
    ...    teste composto tres
    ...    null
    ...    EdicaoTeste

[CT36] Editar campo TELEFONE da empresa (telephone) contendo caracteres válidos (Numeros)
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Empresa hshsgs LTDA
    ...    12126456000155
    ...    test@testjoao.com.br
    ...    abcdefghija
    ...    teste composto tres
    ...    123456789
    ...    EdicaoTeste

[CT37] Editar campo TELEFONE da empresa (telephone) contendo caracteres inválidos (Letras)
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Empresa hshsgs LTDA
    ...    12126456000155
    ...    test@testjoao.com.br
    ...    abcdefghija
    ...    teste composto tres
    ...    abcDEFGeiJ
    ...    EdicaoTeste

[CT38] Editar campo TELEFONE da empresa (telephone) contendo caracteres inválidos (Especiais)
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Empresa hshsgs LTDA
    ...    12126456000155
    ...    test@testjoao.com.br
    ...    abcdefghija
    ...    teste composto tres
    ...    %$#@!%&*
    ...    EdicaoTeste

[CT39] Editar campo TELEFONE da empresa (telephone) contendo caracteres numéricos estrangeiros (Não aceitar)
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Empresa hshsgs LTDA
    ...    12126456000155
    ...    test@testjoao.com.br
    ...    abcdefghija
    ...    teste composto tres
    ...    ٩٨٧٦٥٤٣٢١٠
    ...    EdicaoTeste

[CT40] Editar campo TELEFONE da empresa (telephone) com MENOS de 15 caracteres numéricos (14 caracteres)
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Empresa hshsgs LTDA
    ...    12126456000155
    ...    test@testjoao.com.br
    ...    abcdefghija
    ...    teste composto tres
    ...    12345678901234
    ...    EdicaoTeste

[CT41] Editar campo TELEFONE da empresa (telephone) com MAIS de 15 caracteres numéricos (16 caracteres)
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Empresa hshsgs LTDA
    ...    12126456000155
    ...    test@testjoao.com.br
    ...    abcdefghija
    ...    teste composto tres
    ...    1234567890123456
    ...    EdicaoTeste

[CT42] Editar campo TELEFONE da empresa (telephone) com MENOS de 20 caracteres numéricos (19 caracteres)
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Empresa hshsgs LTDA
    ...    12126456000155
    ...    test@testjoao.com.br
    ...    abcdefghija
    ...    teste composto tres
    ...    1234567890123456789
    ...    EdicaoTeste

[CT43] Editar campo TELEFONE da empresa (telephone) com MAIS de 20 caracteres numéricos (21 caracteres)
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Empresa hshsgs LTDA
    ...    12126456000155
    ...    test@testjoao.com.br
    ...    abcdefghija
    ...    teste composto tres
    ...    123456789012345678901
    ...    EdicaoTeste

[CT44] Editar campo E-MAIL da empresa (mail) vazio (Campo Obrigatório)
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Empresa hshsgs LTDA
    ...    12126456000155
    ...    
    ...    abcdefghija
    ...    teste composto tres
    ...    12345656
    ...    EdicaoTeste

[CT45] Editar campo E-MAIL da empresa (mail) nulo (Campo Obrigatório)
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Empresa hshsgs LTDA
    ...    12126456000155
    ...    null
    ...    abcdefghija
    ...    teste composto tres
    ...    12345656
    ...    EdicaoTeste

[CT46] Editar campo E-MAIL da empresa (mail) formato inválido Ex: sem parte local - @gmail.com
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Empresa hshsgs LTDA
    ...    12126456000155
    ...    @gmail.com
    ...    abcdefghija
    ...    teste composto tres
    ...    12345656
    ...    EdicaoTeste

[CT47] Editar campo E-MAIL da empresa (mail) inválido Ex: contendo espaços - teste @gmail.com
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Empresa hshsgs LTDA
    ...    12126456000155
    ...    teste @gmail.com
    ...    abcdefghija
    ...    teste composto tres
    ...    12345656
    ...    EdicaoTeste

[CT48] Editar campo E-MAIL da empresa (mail) sem '@' Ex: sem '@' - teste123gmail.com
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Empresa hshsgs LTDA
    ...    12126456000155
    ...    teste123gmail.com
    ...    abcdefghija
    ...    teste composto tres
    ...    12345656
    ...    EdicaoTeste

[CT49] Editar campo DESCRIÇÃO (serviceDescription) vazio (Campo Obrigatório)
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Empresa hshsgs LTDA
    ...    12126456000155
    ...    teste123@gmail.com
    ...    abcdefghija
    ...    teste composto tres
    ...    12345656
    ...    

[CT50] Editar campo DESCRIÇÃO (serviceDescription) nulo (Campo Obrigatório)
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Empresa hshsgs LTDA
    ...    12126456000155
    ...    teste123gmail.com
    ...    abcdefghija
    ...    teste composto tres
    ...    12345656
    ...    null

[CT51] Editar campo DESCRIÇÃO (serviceDescription) contendo caracteres válidos (letras e numeros)
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Empresa hshsgs LTDA
    ...    12126456000155
    ...    teste123gmail.com
    ...    abcdefghija
    ...    teste composto tres
    ...    12345656
    ...    abc123ABC

[CT52] Editar campo DESCRIÇÃO (serviceDescription) contendo caracteres inválidos (Especiais)
    ${corporate_Name}=     Gerar Nome Empresa
    ${matriz}=  Gerar Valor Alfanumerico 14 caracteres

    Editar Empresa Cadastrada    
    ...    Empresa hshsgs LTDA
    ...    12126456000155
    ...    teste123gmail.com
    ...    abcdefghija
    ...    teste composto tres
    ...    12345656
    ...    &¨%$#@
