# Loagind a 32 bit Immediate

Traduzido e adaptado do [original](https://www.cs.umd.edu/class/sum2003/cmsc311/Notes/Mips/load32.html)

### Introdução 

É possível carregar um valor imediato de 32 bits em um registrador? Valores imediatos implicam a parte constante da instrução. Vamsos esquecer, por um momento, que nenhum dos formatos de instrução MIPS suporta constantes de 32 bits. É possível para alguma ISA que usa instruções de 32 bits para carregar um valor imediato arbitrário de 32 bits para um registrador?

Naturalmente, formulando a pergunta dessa maneira, estou dando a resposta. Se a instrução deve ter 32 bits, não há uma forma de fazer isso. Antes de mais nada, se todos os 32 bits são usados para o valor imediato, onde estão os bits para o opcode? Onde estão os bits para indicar em qual registrador colocar o valor imediato? Esta informação também tem que estar lá, mas não há espaço.

Observe que é importante dizer arbitrariamente 32 bits. Claramente, você pode carregar uma quantidade de 32bits usando addi, mas uma vez que addi usa uma quantidade de 16 bits (que é 

