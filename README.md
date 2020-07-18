# Ambiente de desenvolvimento Laravel com Docker

Ambiente de desenvolvimento Laravel utilizando `Docker Compose`.

Esse ambiente possui os seguintes componentes configurados, não sendo necessário tê-los instalados localmente:

1. Node.JS e NPM
2. PHP e Composer
3. PostgreSQL
4. NGINX (servidor web)


> *Observação* O diretório padrão onde o projeto laravel estará armazenado é o `./src`. Esse é o diretório de trabalho para os containers _artisan_, _composer_ e _npm_.


## Criar um novo projeto laravel

```bash
$ docker-compose run --rm composer --prefer-dist create-project laravel/laravel .
```

Ajuste o `.env` do projeto com as informações do banco de dados local (postgres):

```
DB_CONNECTION=pgsql
DB_HOST=postgres
DB_PORT=5432
DB_DATABASE=laravel
DB_USERNAME=laravel
DB_PASSWORD=laravel
```

Execute o seguinte comando para levantar o banco e o servidor web (nginx): 

```bash
$ docker-compose up -d
```

Acesse o site do projeto em: `http://localhost:8088`

## Executando o `artisan`, `composer` e `npm`

Para executar o `artisan`, utilize o seguinte comando:

```bash
$ docker-compose run --rm artisan
```

Para executar o `composer`, utilize o seguinte comando: 

```bash
$ docker-compose run --rm composer
```

Para executar o `npm`, utilize o seguinte comando: 

```bash
$ docker-compose run --rm npm
```

## Fluxo de trabalho

Edite os arquivos do projeto laravel localizados no diretório 
`./src` e execute os comandos acima quando for necessário utilizar
os comandos `artisan`, `composer` e `npm`.

Não é necessário utilizar `artisan serve`, pois já existe um
servidor web sendo executado (nginx).