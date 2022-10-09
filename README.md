# ADT portal

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

## Соглашения

Автоматическая проверка кода в репозитории есть настройка для [overcommit](https://github.com/sds/overcommit). Необходимо предварительно включить его с помощью команды `overcommit --install`

Проверка и форматирования стиля ruby кода осуществляется с помощью [rubocop](https://rubocop.org). Для запуска проверки используется команда `bundle exec rubocop`. Для запуска форматирования используется команда `bundle exec rubocop -A`
