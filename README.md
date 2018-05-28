# ProgramacaoFuncional_Projeto_Blockchain_Virjao

Blockchain Virjão - Um experimento em blockchain.

Lista encadeada de objetos de transação (blocos).
Um bloco terá uma transação e um hash.
Bloco => String Transação
Depois de criado o bloco, ele será armazenado no Banco de Dados (BDVirjão)


Transação conterá as informações de recebedor, pagador e valor
Tupla que conterá esses três dados e qualquer outro necessário para a transação.


Utilizará sistema de hash identificador.
O hash utiliza os valores do hash anterior, transação única (no nosso caso) do bloco atual como entrada e devolve como saída um hash que será associado ao bloco.
Criação do hash será uma função que pega esses dados, cria um hash e associa a um bloco.
funciton :: String -> Transação(3-tupla) -> String



Operação de inserção por um servidor HTTP
Sempre que for recebida uma requisição “POST” criará um novo bloco.
Requisição “GET” trará um saldo da conta requisitada.
