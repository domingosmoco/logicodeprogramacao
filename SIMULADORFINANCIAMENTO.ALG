algoritmo "SimuladorFinanciamento"
var
   valor        : real
   taxaAnual    : real
   parcelas     : inteiro
   taxaFinal    : real
   fator        : real
   valorTotal   : real
   jurosTotal   : real
   valorParcela : real
   saldo        : real
   jurosMes     : real
   amortizacao  : real
   taxaMensal   : real
   i            : inteiro

inicio

   // ========================================
   // LEITURA DOS DADOS
   // ========================================
   escreval("====================================")
   escreval("   SIMULADOR DE FINANCIAMENTO")
   escreval("====================================")
   escreval("")

   escreva("Digite o valor do financiamento: Kz ")
   leia(valor)

   escreva("Digite a taxa de juros anual (%): ")
   leia(taxaAnual)

   escreva("Digite o numero de parcelas: ")
   leia(parcelas)

   // ========================================
   // REGRAS ADICIONAIS
   // ========================================
   taxaFinal <- taxaAnual

   se parcelas > 12 entao
      taxaFinal <- taxaFinal + 0.5
      escreval("")
      escreval(">> Regra aplicada: parcelas > 12, taxa acrescida de +0.5%")
   fimse

   se valor > 100000 entao
      taxaFinal <- taxaFinal - 1.0
      escreval(">> Regra aplicada: valor > Kz 100.000, desconto de 1% na taxa")
   fimse

   // ========================================
   // CALCULOS PRINCIPAIS
   // ========================================
   fator        <- (1 + taxaFinal / 100) ^ parcelas
   valorTotal   <- valor * fator
   jurosTotal   <- valorTotal - valor
   valorParcela <- valorTotal / parcelas
   taxaMensal   <- taxaFinal / 100 / 12

   // ========================================
   // EXIBIR RESUMO
   // ========================================
   escreval("")
   escreval("====================================")
   escreval("           RESUMO")
   escreval("====================================")
   escreval("Taxa final aplicada : ", taxaFinal:5:2, "%")
   escreval("Valor financiado    : Kz ", valor:10:2)
   escreval("Juros total         : Kz ", jurosTotal:10:2)
   escreval("Valor total         : Kz ", valorTotal:10:2)
   escreval("Valor da parcela    : Kz ", valorParcela:10:2)

   // ========================================
   // TABELA DE AMORTIZACAO
   // ========================================
   escreval("")
   escreval("====================================")
   escreval("     TABELA DE AMORTIZACAO")
   escreval("====================================")
   escreval("Parcela | Saldo Devedor    | Juros Mes    | Amortizacao")
   escreval("--------------------------------------------------------")

   saldo <- valor

   para i de 1 ate parcelas faca
      jurosMes    <- saldo * taxaMensal
      amortizacao <- valorParcela - jurosMes
      saldo       <- saldo - amortizacao

      se saldo < 0 entao
         saldo <- 0
      fimse

      escreval(i:5, "   | Kz ", saldo:12:2, " | Kz ", jurosMes:10:2, " | Kz ", amortizacao:10:2)
   fimpara

   escreval("--------------------------------------------------------")
   escreval("")
   escreval("Simulacao concluida!")

fimalgoritmo