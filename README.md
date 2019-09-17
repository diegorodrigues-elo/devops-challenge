Desafio Devops Elo

# Parte 1

## Sobre o 'teste'

Esse é um teste feito para conhecer um  pouco mais de cada candidato a vaga de DevOps na Elo. Não se trata de um teste objetivo, capaz de gerar uma nota ou uma taxa de acerto, mas sim de um estudo de caso com o propósito de conhecer os conhecimentos, experiências e modo de trabalhar de um cadidato. Sinta-se livre para desenvolver sua solução para o problema proposto.

## Cenário

Dentro do diretório `app` existe uma aplicação muito simples em Flask. Quando essa aplicação  subir ela irá ler uma variável de ambiente `ELO_PASS` que será a senha da api. Ou seja, ao executarmos uma chamada para essa aplicação devemos passar um `Header` de  `Authorization` com o token específico. Por exemplo: `curl -H "Authorization: Token VALOR_DA_ENVVAR_ELO_PASS" http://localhost/`. Você deve nos informar como podemos definir/trocar esse token facilmente.

Seu objetivo é fazer deploy dessa aplicação na AWS na conta que foi enviada por e-mail pelo seu contato de RH na Elo. Mas não se preocupe, não iremos olhar a conta ou chamar sua aplicação já rodando, queremos que você crie uma forma de que possamos recriar toda sua infraestrutura em nossa conta de forma simples. Você escolhe a forma. Crie um arquivo `part1.md` descrevendo todos os passos para que possamos executar sua infraestrutura em nosso ambiente. Esses são os pontos de atenção:

* Você deverá partir de um ambiente na AWS sem nenhuma infraestrutura já criada.
* A aplicação deverá rodar em containner docker.

Sinta-se livre para mudar o código da aplicação se julgar necessário.

# Parte 2

## Sobre o 'teste'

Esse teste busca entender seus conceitos de arquitetura na AWS, observando um cenário já existente. Queremos saber se você entende a AWS e seus produtos e como funciona a comunicação entre eles.

## Cenário 

Observando a imagem abaixo, crie um arquivo `part2.md` com a descrição técnica do fluxo dessa topologia, conforme seu entendimento.

![cenario-aws-teste](https://user-images.githubusercontent.com/29125605/29424258-5d7d5c2a-8355-11e7-9701-2fb26621b6b0.png)

### Entrega

1. Efetue o fork deste repositório e crie um branch com o seu nome e sobrenome. (exemplo: fulano-dasilva)
2. Após finalizar o desafio, crie um Pull Request.
3. Aguarde algum contribuidor realizar o code review.

Bom trabalho!
