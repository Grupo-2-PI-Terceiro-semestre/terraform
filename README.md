# Terraform Project Setup

## 1. Criar uma Chave PEM
Antes de iniciar o Terraform, crie uma chave SSH para acessar suas instâncias:
```sh
ssh-keygen -t rsa -b 4096 -m pem -f orderhub.pem
chmod 400 orderhub.pem
```
Isso gerará dois arquivos:
- `orderhub.pem`: A chave privada (mantenha segura!)
- `orderhub.pem.pub`: A chave pública (será usada no Terraform)

## 2. Inicializar o Terraform
Dentro do diretório do projeto Terraform, execute:
```sh
terraform init
```
Isso baixará os provedores necessários e inicializará o projeto.

## 3. Validar a Configuração
Antes de aplicar as mudanças, valide a configuração para evitar erros:
```sh
terraform validate
```

## 4. Planejar as Mudanças
Veja quais recursos serão criados antes de aplicá-los:
```sh
terraform plan -out=tfplan
```

## 5. Aplicar as Mudanças
Crie os recursos na AWS:
```sh
terraform apply tfplan
```
Confirme a execução digitando `yes` quando solicitado.

## 6. Verificar os Recursos Criados
Liste os recursos gerenciados pelo Terraform:
```sh
terraform state list
```

## 7. Destruir os Recursos (Opcional)
Se precisar remover todos os recursos criados:
```sh
terraform destroy
```
Confirme a execução digitando `yes` quando solicitado.

---
Agora seu projeto Terraform está pronto para ser usado com a chave `orderhub.pem`! 🚀

