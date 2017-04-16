   # MIPS Instruction Reference
   
   Esta é uma descrição do conjunto de intrução MIPS, seus significados, sintaxe, semântica e codificação de bits. A sintaxe dada a cada instrução referencia à sintaxe da linguagem assembly suportada pelo assembler do MIPS. 

  Hífens na codificação indicam bits "don't care" (que não importam), que não são considerados quando uma instrução está sendo decodificada.  

Os registradores de propósito geral (GPRs) são indicados com um sinal de dólar ($). As palavras SWORD e UWORD referem-se a tipos de dados de 32 bits com sinal e sem sinal, respectivamente.

A maneira pela qual o processador executa uma instrução e avança seus contadores é a seguinte:

1. Execute a instrução no PC
2. Copie nPC para PC
3. Adicione 4 ou o offset de deslocamento para nPC

Este comportamento é indicado nas especificações de instrução abaixo. Para abreviar, a função advance_pc(int) é usada em muitas das descrições de instruções. Esta função é definida da seguinte forma:

	void advance_pc (SWORD offset) {   
		PC  =  nPC;  
		nPC  += offset;
	}

Obs: TODOS os valores imediatos devem ser de sinal estendido. Depois disso, você os trata como números com ou sem sinal de 32 bits. Para as instruções não imediatas, a única diferença entre instruções com ou sem sinal é que as instruções com sinal podem gerar um overflow (o que não nos preocupa nesse laboratório.

As descrições de instruções são dadas abaixo:

#### ADD - Add
<p>Descrição:   Soma dois registradores e armazena o resultado em um registrador</p><p>Operação:   $d = $s + $t; advance_pc(4);</p><p>Sintaxe:    add $d, $s, $t</p><p>Codificação: 0000 00ss ssst tttt dddd d000 0010 0000</p>

#### ADDI - Add immediate
Descrição: Soma um registrador e um valor imediato com sinal e armazena o resultado em um registrador.
Operação: $t = $s + imm; advance_pc(4);
Sintaxe: addi $t, $s, imm
Codificação: 0010 00ss ssst tttt iiii iiii iiii iiii

#### ADDIU - Add immediate Unsigned
Descrição: Soma um registrador e um valor imediato sem sinal e armazena o resultado em um registrador.
Operação: $t = $s + imm; advance_pc(4);
Sintaxe: addiu $t, $s, imm
Codificação: 0010 01ss ssst tttt iiii iiii iiii iiii
	
#### ADDU - Add unsigned 
Descrição - Soma dois registradores e armazena o resultado em um registrador
Operação: $d = $s + $t; advance_pc (4); 
Sintaxe: addu $d, $s, $t 
Codificação: 0000 00ss ssst tttt dddd d000 0010 0001

#### AND - Bitwise and
Descrição: Realiza and bit a bit entre dois registradores e armazena o resultado em um registrador
Operação: $d = $s & $t; advance_pc (4); 
Sintaxe: and $d, $s, $t 
Decodificação: 0000 00ss ssst tttt dddd d000 0010 0100

#### ANDI - Bitwise and immediate
Descrição: Realiza and bit a bit entre um registrador e um valor imediato e armazena o resultado em um registrador
Operação: $t = $s & imm; advance_pc (4); 
Sintaxe: andi $t, $s, imm 
Decodificação: 0011 00ss ssst tttt iiii iiii iiii iiii	

#### BEQ - Branch on equal 
Descrição: Efetua o desvio se os dois registradores forem iguais
Operação:  if $s == $t advance_pc (offset << 2)); else advance_pc (4); 		Sintaxe: beq $s, $t, offset 
Decodificação: 0001 00ss ssst tttt iiii iiii iiii iiii

#### BGEZ - Branch on greater than on equal to zero 
Descrição: Efetua o desvio se o registrador é maior que ou igual a zero 
Operação: if $s >= 0 advance_pc (offset << 2)); else advance_pc (4); 		Sintaxe: bgez $s, offset 
Decodificação: 0000 01ss sss0 0001 iiii iiii iiii iiii

	continua... 
	
	original: https://app.box.com/s/lcxnc8upk5argkcjabux4nk7wuhskljc/1/23066158737/155419759424/1
