# Parte 2

## Sobre o 'teste'

Esse teste busca entender seus conceitos de arquitetura na AWS, observando um cenário já existente. Queremos saber se você entende a AWS e seus produtos e como funciona a comunicação entre eles.

## Cenário 

Observando a imagem abaixo, crie um arquivo `part2.md` com a descrição técnica do fluxo dessa topologia, conforme seu entendimento.

![cenario-aws-teste](https://user-images.githubusercontent.com/29125605/29424258-5d7d5c2a-8355-11e7-9701-2fb26621b6b0.png)

## Solução

Basicamente, podemos dizer que a imagem representa uma aplicação web, totalmente serverless, exposta no endereço www.meusite.com.br.

O fluxo de acesso à aplicação ocorre da seguinte maneira:

1. Um usuário que deseja acessar a aplicação digita no browser a URL www.meusite.com.br
2. Assumindo que se trata de um protocolo HTTP, a URL será resolvida pelo serviço DNS e a máquina do usuário receberá um IP com o qual consegue se comunicar.
3. Para estabelecer comunicação com o servidor, será realizado um three-way-handshake, onde o cliente e o servidor estabelecem os padrões de comunicação.
4. Na arquitetura apresentada, o usuário está se comunicando com o Cloud Front, que faz a função de CDN na AWS. Neste ponto, podemos dizer que o Cloud Front é usado para que o cliente acesse as informações mais próximas à sua região e, assim, tenha uma menor latência durante a comunicação. Entendo que o Cloud Front também está sendo utilizado como Cache para evitar grande acesso ao S3, onde estão armazenados os arquivos estáticos. Além, é claro, de oferecer uma série de requisitos de segurança, como mitigação de ataque DDoS nas camadas 3 e 4.
5. Uma vez com o IP e comunicação estabelecida, o cliente pode solicitar a aplicação em si. Neste momento, caso os arquivos estáticos ainda não estejam no Cloud Front, será acessado um Bucket S3 para disponibilização do conteúdo.
6. O conteúdo será renderizado na tela e o cliente poderá realizar as operações que a aplicação o permita.
7. Pela arquitetura dada, as ações (API's) estão disponibilizadas através do Amazon API gateway e são todas serverless, utilizando o serviço Lambda, que, por sua vez, gravam dados em um banco não-relacional, que neste caso foi utilizado o DynamoBD. Como a chamada ao API Gateway também está sendo feita pelo Cloud Front, temos um ganho arquitetural de performance permitindo que a saída das API's sejam guardadas em cache e a aplicação possa suportar picos de tráfego sem acessar desnecessariamente o back-end.
8. É importante citar, que para criação de uma camada adicional de segurança, a arquitetura apresenta uma VPC, onde são colocadas as funções Lambdas e o banco de dados para evitar possíveis acessos externos (o único acesso é através do API Gateway).