# Parte 1

## Cenário

Dentro do diretório `app` existe uma aplicação muito simples em Flask. Quando essa aplicação  subir ela irá ler uma variável de ambiente `ELO_PASS` que será a senha da api. Ou seja, ao executarmos uma chamada para essa aplicação devemos passar um `Header` de  `Authorization` com o token específico. Por exemplo: `curl -H "Authorization: Token VALOR_DA_ENVVAR_ELO_PASS" http://localhost/`. Você deve nos informar como podemos definir/trocar esse token facilmente.

Seu objetivo é fazer deploy dessa aplicação na AWS na conta que foi enviada por e-mail pelo seu contato de RH na Elo. Mas não se preocupe, não iremos olhar a conta ou chamar sua aplicação já rodando, queremos que você crie uma forma de que possamos recriar toda sua infraestrutura em nossa conta de forma simples. Você escolhe a forma. Crie um arquivo `part1.md` descrevendo todos os passos para que possamos executar sua infraestrutura em nosso ambiente. Esses são os pontos de atenção:

* Você deverá partir de um ambiente na AWS sem nenhuma infraestrutura já criada.
* A aplicação deverá rodar em container docker.

Sinta-se livre para mudar o código da aplicação se julgar necessário.

## Solução

Existem algumas formas de deploy de container docker na AWS, como por exemplo, utilizando o EC2 ou ECS, e ainda gerenciando os containers com Kubernetes ou com o Fargate, etc.

Na solução deste problema, optei por realizar um solução simples já que se trata de um Lab/POC, criando um cluster ECS para deploy de uma imagem docker.

O arquivo Dockerfile pode ser encontrado dentro do diretório app e, como podem ver, é bem simples.

Para publicação da imagem no ECR e criação do cluster ECS, recomendo seguir o tutorial disponível em: https://www.codeastar.com/tutorial-deploy-flask-docker-amazon-ecs/, com uma resalva... Não esqueça de configurar o ACCESS KEY ID e SECRET KEY ID antes de usar o comando: (aws ecr get-login --no-include-email --region us-east-1)

    A configuração deve ser feita utilizando o comando: aws configure

A aplicação está disponível e pode ser acessada pelo IP público que pode ser visualizado na task dentro do cluster ECS criado. A variável ELO_PASS foi configurada como variável de ambiente na criação do cluster ECS e tem como valor atual "RenanCSO". Logo, um exemplo de chamada seria: curl -H "Authorization: Token RenanCSO" http://3.216.95.168 (onde o IP deve ser substituído pelo IP público vigente).

Seria possível automatizar os processos de build e deploy da aplicação, utilizando por exemplo, AWS CodeBuild, AWS CodePipeline e AWS CloudFormation, porém, entendo que para efeitos de Lab/POC não se faz necessário tal automatização.