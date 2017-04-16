# Big and Little Endian

De: https://www.cs.umd.edu/class/sum2003/cmsc311/Notes/Data/endian.html
(traduzido e adaptado)

Conceitos básicos de memória

Para entender o conceito de big endian e little endian, você precisa entender a memória. Por sorte, nós precisamos apenas de uma abstração de alto nível da memória. Você não precisa saber todos os pequenos detalhes de como a memória funciona. 

Tudo que você precisa saber sobre memória é que é um grande vetor. Mas um grande vetor contendo o quê? O vetor contém bytes. Em organização de computadores, as pessoas não usam o termo "índice" para se referir às posições do vetor. Em vez disso, nós usamos o termo "endereço". "Endereço" e "índice" significam a mesma coisa, então se você está ficando confuso, apenas pense em "endereço" como "índice". 

Cada endereço armazena um elemento do "vetor" de memória. Cada elemento é tipicamente um byte. Há algumas configurações de memória onde cada endereço armazena algo diferente de um byte. Por exemplo, você poderia armazenar um nybble(?) ou um bit. Entretanto, eles são extremamente raros, então por enquanto nós iremos assumir que todos os endereços de memória armazenam bytes. 

Eu direi algumas vezes que memória é byte-addressable (endereçável por bytes). Este é apenas um jeito sofisticado de dizer que cada endereço armazena um byte. Se eu disser que memória é nybble-addressable, isso significa que cada endereço de memória armazena um nybble. 

### Armazenando palavras na memória

Nós definimos uma palavra como 32 bits. Isso é o mesmo que 4 bytes. Inteiros, números de ponto flutuante de precisão simples, e instruções MIPS são todos de 32 bits de comprimento. Como nós podemos armazenar estes valores na memória? Afinal, cada endereço de memória pode armazenar um único byte, não 4 bytes. 

A resposta é simples. Nós dividimos os 32 bits em 4 bytes. Por exemplo, suponha que nós temos uma quantidade de 32 bits, escritos como 90AB12CD (base hexadecimal). Uma vez que cada dígito hexadecimal é 4 bits, nós precisamos de 8 dígitos hexadecimais para representar o valor de 32 bits. 

Então, os 4 bytes são: 90, AB, 12, CD onde cada byte requer dois dígitos hexadecimais.  

Acontece que existem duas formas de armazenar isso na memória. 

#### Big Endian

Em big endian, você armazena o byte mais significativo no menor endereço. Veja como seria:

Endereço | Valor 
-------- |--------
1000	   | 90
1001	   | AB 
1002     | 12
1003	   | CD  








