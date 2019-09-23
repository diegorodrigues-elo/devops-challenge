## Resposta:

* O usuário faz a requisição ao site `www.meusite.com.br`
* O Browser vai fazer a resolução de DNS, vai ate os servidores de DNS do dominio `meusite.com.br` que pela imagem NÃO está usando route53
* O conteúdo estático do site está no S3 e o Cloud Front faz o papel de CDN (fazendo cache de conteúdo estático para zonas geograficamente mais perto do usuário para melhorar a performance)
* Esse conteúdo estático faz chamadas via apara APIs em Lambda que estão publicadas via API Gateway (por questão de segurança e monitoramento)
* As APIs em Lambda faz acesso ao banco NoSQL DynamoDB.
* As funções lambda estão Configuradas para acessar o DynamoDB via uma VPC Privada
