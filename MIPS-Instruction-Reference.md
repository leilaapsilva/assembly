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

	**ADD - Add**
	Descrição: Soma dois registradores e armazena o resultado em um registrador
	Operação: $d = $s + $t; advance_pc(4);
	Sintaxe: add $d, $s, $t
	Codificação: 0000 00ss ssst tttt dddd d000 0010 0000

	**ADDI - Add immediate**
	Descrição: Soma um registrador e um valor imediato com sinal e armazena o resultado em um registrador.
	Operação: $t = $s + imm; advance_pc(4);
	Sintaxe: addi $t, $s, imm
	Codificação: 0010 00ss ssst tttt iiii iiii iiii iiii

	**ADDIU - Add immediate Unsigned**
	Descrição: Soma um registrador e um valor imediato sem sinal e armazena o resultado em um registrador.
	Operação: $t = $s + imm; advance_pc(4);
	Sintaxe: addiu $t, $s, imm
	Codificação: 0010 01ss ssst tttt iiii iiii iiii iiii
	
	ADDU - Add unsigned 
	Descrição - Soma dois registradores e armazena o resultado em um registrador
	Operação: $d = $s + $t; advance_pc (4); 
	Sintaxe: addu $d, $s, $t 
	Codificação: 0000 00ss ssst tttt dddd d000 0010 0001

	
