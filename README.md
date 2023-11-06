# CookAI

## 1. Introdução

Nesse checkpoint 6 de devops, a aplicação é um gerador de receitas, previamente criado na global solution do 3° semestre, e adaptado com dockerfile para rodar corretamente no ACR/ACI

## 2. Vídeo

https://youtu.be/EUf9bA6zmDg

## 3. Endpoints

### 3.1 AuthController

- **Endpoint:** POST /login
- **Descrição:** Este endpoint é utilizado para autenticar o usuário.
- **Corpo da Solicitação:** O corpo da solicitação deve ser um JSON contendo o login e a senha do usuário.
  
  **Requisição:**
  ```json
  {
    "login": "neurotrix@example.com",
    "password": "teste123"
  }
  ```
  
**Resposta:** Caso a autenticação seja um sucesso, é retornado um JWT de autenticação com validade de 30 minutos.

### 3.2 RecipeController

- **Endpoint:** POST /recipe
- **Descrição:** Este endpoint é utilizado para o usuário enviar os ingredientes que serão utilizados para a criação da receita.
- **Corpo da Solicitação:** O corpo da solicitação deve ser um JSON contendo a mensagem do usuário.
- **Necessário enviar Bearer token gerado no login em 'Authorization' para utilizar o endpoint**

 **Requisição:**
  ```json
  {
    "ingredientes": "macarrão gravata, tomate, sal, pimenta, salsicha",
    "dificuldade": "facil",
    "tempoMaximo" : "60 minutos"
  }
  ```

**Resposta:** Em caso de sucesso, é retornada a receita com os ingredientes solicitados

- **Endpoint:** GET /recipe?pageNumber=0
- **Descrição:** Este endpoint é utilizado para obter as receitas enviadas pelo usuário utilizando o parametro "pageNumber" = 0.
- **Necessário enviar Bearer token gerado no login em 'Authorization' para utilizar o endpoint**

 **Requisição:**
  ```URL
   GET http://localhost:8080/recipe?pageNumber=0
  ```
**Resposta:** Em caso de sucesso, retorna uma lista de todas as receitas geradas pelo usuário.


- **Endpoint:** GET /recipe/all?pageNumber=0
- **Descrição:** Este endpoint é utilizado para obter as receitas de todos os usuários, a consulta é paginada e retorna 5 resultados por página, sendo necessário passar o parametro "pageNumber" para trocar de página.
- **Necessário enviar Bearer token gerado no login em 'Authorization' para utilizar o endpoint**

 **Requisição:**
  ```URL
   GET http://localhost:8080/recipe/all?pageNumber=0
  ```
**Resposta:** Em caso de sucesso, retorna uma lista das receitas geradas por todos os usuários.

### 3.3 UserController

- **Endpoint:** POST /user/register
- **Descrição:** Este endpoint é utilizado para registrar um novo usuário.
- **Corpo da Solicitação:** O corpo da solicitação deve ser um JSON contendo as informações do usuário (nome, login, senha, etc.).

 **Requisição:**
  ```json
{
  "name": "Leandro",
  "email": "neurotrix@fiap.com",
  "password": "teste123"
}
  ```

**Resposta:** Retorna 200 OK caso o usuário seja criado corretamente

- **Endpoint:** GET /user/all 
- **Descrição:** Este endpoint é utilizado para obter uma lista de todos os usuários.
- **Necessário enviar Bearer token gerado no login em 'Authorization' para utilizar o endpoint**

 **Requisição:**
  ```URL
   GET http://localhost:8080/user/all
  ```
  
**Resposta:** Em caso de sucesso, retorna uma lista de todos os usuários.