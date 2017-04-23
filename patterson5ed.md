2.1 Introdução

Para comandar o hardware de um computador, você deve falar na língua dele. As palavras de uma linguagem de computador são chamadas instruções, e seu vocabulário é chamado de conjunto de instruções. Neste capítulo, você verá o conjunto de instruções de um computador real, na forma escrita por pessoas e na forma lida pelo computador. Nós introduzimos instruções em um modelo top-down. Começando com uma notação que parece com uma linguagem de programação restrita, nós refinamos-a passo-a-passo até você ver a linguagem real de um computador real. O capítulo 3 continua nossa "descida", unveinling o hardware para aritmética e a representação de números de ponto-flutuante.
	Você deve pensar que as linguagens de computadores poderiam ser tão distintas quanto linguagens de pessoas, mas na realidade linguagens de computação são muito simulares, mais como dialetos locais do que linguagens independentes. Hence, uma vez que você aprende uma, é fácil aprender outras. 
	O conjunto de instruções escolhido vem de MIPS Technologies, e é um exemplo elegante do conjunto de instruções projetado desde os anos 80. Para demonstrar quão fáci é "pick up" outros conjuntos de instruções, nós daremos uma olhada rápida em três outros conjuntos de instruções populares.

1. ARMv7 é similar ao MIPS. Mais de 9 bilhões de chips com processadores ARM foram produzidos em 2011, fazendo-o o mais popular conjunto de instruções do mundo.
2. O segundo exemplo é o Intel x86, que ---
3. O terceiro exemplo é ARMv8, que extende o tamanho de endereço do ARMv7 de 32 para 64 bits. Ironicamente, como veremos, esse conjunto de instruções de 2013 é mais próximo do MIPS do que do ARMv7.

Esta similaridade de conjuntos de instruções ocorre porque todos os computadores são construídos de tecnologias de hardware baseadas em princípios similares e porque há algumas operações básicas que todos os computadoes devem fornecer. Moreover, projetistas de computadores tem um ponto em comum: Para encontrar uma linguagem que torna fácil construir o harware e o compilador enquanto maximiza a performance e minimiza custos e energia. Este ponto é "time honored"; a seguinte citação foi escrita antes de você poder comprar um computador, e isso é tão verdade hoje quanto era em 1947:

É fácil ver por métodos formais-lógicos que há certos conjuntos de instruções que são em abstrato adequados ao controle e por causa da execução de algums sequ^cias de operações... As considerações realmente decisivas do presente ponto de vista, em selecionar um, são mais uma natureza prática: somplicidade de equipamento demandado, e a clareza de sua aplicação para os problemas atualmente importantes junto com a belocidade de lidar com estes problemas.
					Burks, Goldstine, e von Neumann, 1947

A "simplicidade do equipamento" é uma consideração válida para os computadores atuais assim como era para os de 1950. O objetivo deste capítulo é ensinar um conjunto de isntruções que segue este conselho, mostrando como é representado em hardware e a relação entre linguagens de programação de alto-nível e a mais primitiva. Nossos exemplos estão na linguagem de programação C; a Seção 2.15 mostra como elas podem ser mudadas para uma linguagem orientada a objetos, como Java.
	Enquanto aprende como representar instruções, você irá também descobrir o segredo da computação: o conceito de programa armazenado. Moreover, você irá exercitar suas habilidades de linguagem estrangeira, escrevendo programas na linguagem do computador e rodando-os no simulador que vem com este livro. Você também verá o impacto de linguagens de programação e otimização de compiladores em performance. Nós concluimos com uma olhada na evolução histórica dos conjuntos de instrução e uma visão geral de outros dialetos de computador.
	Nós revelamos nosso primeiro conjunto de instruções como um piece at a time, dando o rationale alonge com as estruturas de computador. Este tutorial top-down, passo-a-passo cobre os componentes com suas explicações, tornando a linguagem de computadores mais paltável. A figura 2.1 dá um preview do conjunto de instruções mostrado neste capítulo.

2.2 Operações do Hardware do Computador

Todo computador deve ser ábil a processar aritmética. A notação de linguagem assembly
	
	add a, b, c 

instrui um computador a adicionar as duas variáveis b e c e colocar sua soma em a. 
Esta notação é rígida em que cada instrução aritmética de MIPS performa apenas uma operação e deve sempre ter exatamente três variáveis. Por exemplo, supondo que nós queremos colocar a soma de quatro variáveis b, c, d e e em uma variável a. (Nesta serão nós seremos deliberavelmente vagos sobre o que é uma "variável"; na próxima seção nós explicaremos isto em detalhes.)
A seguinte sequência de instruções soma as quatro variáveis:

	add a, b, c	#A soma de b e c é colocada em a
	add a, a, d	#A soma de b, c e d está agora em a
	add a, a, e	#A soma de b, c, d e e agora está em a

Assim, levou três instruções para somar quatro variáveis.
As palaras à direita do símbolo # em cada linha são comentários para o leitor humano, então o computador os ignora. Note que diferente de outras linguagens de programação, cada linha desta linguagem pode conter apenas uma instrução. Outra diferença de C é que comentários sempre terminam no fim de uma linha.
O número natural de operandos para uma operação como adição é três: os dois números sendo somados e um lugar para colocar a soma. Requerendo que toda instrução deve ter exatamente três operandos, nem mais nem menos, de acordo com a filosofia de manter o hardware simples: hardware para um número variável de operandos é mais complicado que hardware para um número fixo. Esta situação ilustra o primeiro dos três principios de projeto de hardware:

Princípio de projeto 1: Simplicidade favorece regularidade.

Podemos agora mostrar, em dois exemplos que seguem, a relação de programas escritos em linguagens de alto-nível e programas em sua mais primitiva notação.

Exemplo

Compilando duas declaraçóes de C em MIPS

Esta declaração de um programa em C contém as cinco variáveis a, b, c, d e e. Uma vez que Java veio de C, este exemplo e os próximos trabalham com linguagens de programação de alto-nível.

	a = b + c;
	d = a - e;

Resposta

A tradução de C para linguagem assembly MIPS é feita pelo compilador. Mostre o código MIPS produzido por um compilador.

	add a, b, c
	sub d, a, e

Exemplo - Compilando uma declaração complexa em C para MIPS

Uma declaração complexa contém as cinco variáveis f, g, h, i e j:

	f = (g + h) - (i + j);

O que um compilador C produz?

Resposta - O compilador deve quebrar este trecho em algumas instruções assembly, uma vez que apenas uma operação é realizada em cada instrução MIPS. A primeira instrução MIPS calcula a soma de g e h. Precisamos colocar o resultado em algum lugar, então o compilador cria uma variável temporária, chamada t0:

	add t0, g, h	#variável temporária t0 contém g + h

Como a próxima operação é uma subtração, precisamos calcular a soma de i e j antes de podermos subtrair. Assim, a segunda instrução coloca a soma de i e j em outra variável temporária criada pelo compilador, chamada t1:

	add t1, i, j	#variável temporária t1 contém i + j

Finalmente, a instrução de subtração subtrai a segunda soma da primeira e coloca a diferença na variável f, completando o código compilado:

	sub f, t0, t1	#f recebe t0 - t1, que é (g + h) - (i + j)

Check você mesmo - Para uma dada função, qual linguagem de programação geralmente toma mais linhas de código? Coloque as três representações abaixo em ordem.

1. Java
2. C
3. Linguagem assembly MIPS 

2.3 Operandos do Hardware do Computador

Diferente de programas em linguagens alto-nível, os operandos de instruções aritméticas são restringidos; eles devem ser de um número limidado de locações especiais construidas diretamente no hardware chamadas registradores. Registradores são primitivos usados no projeto de hardware que são visíveis ao programador quando o computador está completo, então você pode pensar em registradores como blocks de construção do computador. O tamanho de um registrador na arquitetura MIPS é 32 bits; grupos de 32 bits ocorrem tão frequentemente que a eles é dado o nome de palavra na arquitetura MIPS.
Uma diferença maior entre variáveis de linguagens de programação e registradores é o número limitado de registradores, tipicamente 32 em computadores em geral, como MIPS. (Veja a seção 2.21 para a história do número de registradores.) Assim, continuando nossa evolução top-down da representação simbólica da linguagem MIPS, nesta seção nós adicionamos a restrição que os três operandos em instruções de aritmética no MIPS devem ser escolhidos de um dos 32 registradores de 32 bits.
A razão para o limite de 32 registradores pode ser encontrada no segundo dos nossos três princípios de projeto de hardware:

Princípio de projeto 2: Menor é mais rápido.

Um grande número de registradores pode aumentar o tempo de ciclo de clock simplesmente porque leva mais sinais eletrônicos quando eles ..
Dicas como "menor é mais rápido" não são absolutas; 31 registradore podem não ser mais rápidos que 32. Porém, a verdade por trás destar observações causa projetistas de computadores a levar isso a sério. Neste caso, o projetista deve balanciar o apelo de programas para mais registradores com o desejo do projeto de manter o ciclo de clock rápido. Outra razão para ão usar mais de 32 registradores é o número de bits que isso tomaria no formato de instrução, como a seção 2.5 demonstra.
O capítulo 4 mostra a regra central de registradores executam na construção do hardware; como vimos neste capítulo, uso efetivo de registradores é crítico à performance do programa. 
Nós poderíamos simplismente escrever instruções usando números para registradores, de 0 a 31, porém a convenção do MIPS é usar nomes de dois caracteres seguidos de um sinal de dolás para representar um registrador. A seção 2.8 mostra as razçoes por trás destes nomes. Por enquanto, nós usaremos $s0, $s1, ... para registradores que correspondem a variáveis em programas de C e Java e $t0, $t1, ...  para registradores temporários necessários para compilar o programa em instruções MIPS.

Exemplo - Compilando uma declaração em C usando registradores

É trabalho do compilador associar variáveis de programas com registradores. Tome, por exemplo, a declaração de nosso exemplo anterior:

	f = (g + h) - (i + j);

As variáveis f, g, h, i e j são associadas aos registradores $s0, $s1, $s2, $s3 e $s4, respectivamente. Qual é o código MIPS compilado? 

Resposta - O programa compilado é muito similar ao prieiro exemplo, exceto que nós mudamos as variáveis com nomes de registradores mencionados acima mais registradores temporários, $t0 e $t1, que correspondem as variáveis temporárias abaixo:
	add $t0,$s1,$s2 # registrador $t0 contém g + h
	add $t1,$s3,$s4 # registrador $t1 contém i + j
	sub $s0,$t0,$t1 # f recebe $t0 – $t1, que é (g + h)–(i + j)
	
Operandos de memória

Linguagens de programação tem variáveis simples que contém elementos de dados, como nesses exemplos, porém eles tamém tem estruturas de dados mais complexas - arrays e estruturas. Estas estruturas de dados complexas podem conter muito mais elementos de dados do que registradores existentes em um computador. Como pode um computador representar e acessar estruturas tão grandes?
Recordando os cinco componentes de um computador introduzidos no capítulo 1 e repetidos na página 61. O processador pode manter apenas uma pequena quantidade de dados em registradores, mas memória de computadores contém bilhões de elementos de dados. Assim, estruturas de dados (arrays e estruturas) são mantidos na memória. 
Como mostrado abaixo operações aritméticas ocorrem apenas em registradores em instruções MIPS; porém, MIPS pode incluir instruções que transferem dados entre memória e registradores. Essas instruções são chamadas instruções de transferência de dados. Para acessar uma palavra na memória, a instrução deve fornecer o endereço de memória. Memória é apenas um grande, unidimensional, array, com o endereço começando do índice do array, começando em 0. Por exemplo, na figura 2.2, o endereço do terceiro elemento de dado é 2, e o valor de memória[2] é 10.
As instruções de transferência de dados que copiam dados da memória para um registração são tradicionalmente chamadas load. O formato da instrução load é o nome da operação seguido pelo registrador a ser carregado, então uma constante e registrador usado para acessar a memória. A soma da constante da instrução e o conteúdo do segundo registrador forma o endereço de memória. O nome atual MIPS para esta instrução é lw, sendo load word.
	
Exemplo - Compilando um trecho quando um operando está na memória

Vamos assumir que A é um array de 100 palavras e que o compilador tem associado as variáveis g e h com os registradores $s1 e $s2 como antes. Vamos assumir também que o endereço inicial, ou endereço base, de um array está em $s3. Compile esta declaração em C:

	g = h + A[8];

Resposta - Há uma única operação nesta decaraçao, um dos operandos está na memória, então nós devemos primeiro transferir A[8] para um registrador.O endereço deste array é a soma da base do array A, encontrado no registrador $s3, mais o número para selecionar o elemento 8. O dado deve ser colocado em um registrador temporário para uso na próxima instrução. Baseado na figura 2.2, a primeira instrução compilada é

	lw	$t0, 8($s3)	#Reg temporário $t0 recebe A[8]

(Nós faremos um pequeno ajuste nesta instrução, mas nós usaremos esta simplificada versão por enquanto.) A instrução seguinte pode operar no valor em $t0 (que é igual a A[8]) desde que está em um registrador. A instrução deve adicionar h (contido em $s2) a A[8] (contido em $t0) e colocar a soma em um registrador correspondente a g (associado com $s1):

	add	$S1, $S2, $t0	#g = h + A[8]

A constante na instrução de transferencia de dados (8) é chamada de offset, e o registrador somado para formar o endereço ($s3) é chamado de registrador base.

