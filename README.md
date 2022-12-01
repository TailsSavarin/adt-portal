# Nasa project

## Main technologies:
1. Vue version - ***3.2.40***
2. Vue-router version - ***4.1.5***
3. Pinia version- ***2.0.23***
4. Axios version- ***1.1.2***

## Description
A simple example of a user's personal account, which contains:

### Login page with moving icons
![Login](https://github.com/Eelllllyy/nasa-portal/blob/main/app/assets/images/login.png)
### Main page with actions
![Main](https://github.com/Eelllllyy/nasa-portal/blob/main/app/assets/images/main.png)

### Page with information about the user, as well as the ability to edit it
![Profile](https://github.com/Eelllllyy/nasa-portal/blob/main/app/assets/images/profile.png)
![Edit](https://github.com/Eelllllyy/nasa-portal/blob/main/app/assets/images/edit.png)

### Page with pagination by buttons and dynamic
![users](https://github.com/Eelllllyy/nasa-portal/blob/main/app/assets/images/users.png)

## In project uses REST API:

    #GET /api/user/session

    #GET /api/user/users

    #GET /api/user/users/{id}

    #PUT /api/user/users/{id}

    #POST /api/passwords

    #POST /api/session

    #POST /api/user/users

    #DELETE /api/user/session

    #DELETE /api/user/users/{id}

_Creation date:_
>10 / 11 / 2022

## Установка локально

1. __**Опционально*__ Установить систему управления версиями ruby ([rbenv](https://github.com/rbenv/rbenv), [rvm](https://github.com/rvm/rvm))

2. Установить [Ruby 3.1.2](https://www.ruby-lang.org/en/news/2022/04/12/ruby-3-1-2-released/) или одним из перечисленных способов:
    * Через [rvm](https://github.com/rvm/rvm):
        ```shell
        rvm install 3.1.2
        ```
    * Через [rbenv](https://github.com/rbenv/rbenv):
       ```shell
       rbenv install 3.1.2
       ```
3. Установить bundler - `gem install bundler`
4. Установить зависимости  - `bundle install --jobs 20 --retry 5`

5. __**Опционально*__ Установить систему управления версиями node.js ([nodenv](https://github.com/nodenv/nodenv), [nvm](https://github.com/nvm-sh/nvm)
6. Установить [Node.js 16.15.1](https://nodejs.org/) или одним из перечисленных способов:
    * Через [nvm](https://github.com/nvm-sh/nvm):
        ```shell
        nvm install 16.15.1
        ```
    * Через [nodenv](https://github.com/nodenv/nodenv):
        ```shell
        nodenv install 16.15.1
        ```
7. Установить [PostgeSQL](https://www.postgresql.org/download/) (*версия должна быть выше 12ой*)
    * Пример для *MacOS* с помощью [Homebrew](https://brew.sh/):
       ```shell
       brew install postgresql
       ```
    * Пример для *Debian/Ubuntu* с помощью [apt](https://wiki.debian.org/Apt):
       ```shell
       sudo apt install postgresql libpq-dev
       ```
8. Установить [Redis](https://redis.io/download)
    * Пример для *MacOS* с помощью [Homebrew](https://brew.sh/):
       ```shell
       brew install redis
       ```
    * Пример для *Debian/Ubuntu* с помощью [apt](https://wiki.debian.org/Apt):
       ```shell
       sudo apt install redis-server
       ```
9. Запустить [PostgreSQL](https://www.postgresql.org/download/) сервис
    * Пример для *MacOS* с помощью [Homebrew](https://brew.sh/):
       ```shell
       brew services start postgresql
       ```
    * Пример для *Debian/Ubuntu* с помощью [systemd](https://systemd.io/):
       ```shell
       sudo systemctl start postgresql
       ```
10. Запустиь [Redis](https://redis.io/download) сервис
    * Пример для *MacOS* с помощью [Homebrew](https://brew.sh/):
        ```shell
        brew services start redis
        ```
    * Пример для *Debian/Ubuntu* с помощью [systemd](https://systemd.io/):
        ```shell
        sudo systemctl start redis-server
        ```
11. Создать базу данных:
     ```shell
     bundle exec rails db:create db:migrate db:seed
     ```
12. Уставить nodejs зависимости с помощью yarn
    ```shell
    yarn
    ```
13. Создать `.env` файл из шаблона `.env.example` и внести туда свои данные

## Запуск (локально)

1. Запустить приложение `foreman s -f Procfile.dev` (предварительно установив [foreman](https://github.com/ddollar/foreman) с помощью `gem install foreman`)

## Тестирование

Для тестирования backend приложения используется [RSpec](http://rspec.info). Для запуска используется команда `bundle exec rspec`.

Для генерации документации для API используется спецификация [OpenAPI](https://swagger.io/resources/open-api/). Для запуска используется команда `bundle exec rails rswag` 
