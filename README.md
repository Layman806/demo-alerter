# Alerter application

This backend application provides JWT user authenticated alert creation and deletion. It provides a controller to receive
price updates on, which could be used to receive symbol name and it's new price from a rake task running a `faye-websocket` client.
When a price alert is triggered, it shows up in the console as logging info.

Requirements:
* Ruby version: 3.2.2
* Rails 7
* Postgresql server

#### To run
* `bundle install`
* Start postgres server: `sudo pg_ctlcluster 16 main start`
* Initialize the database: `rails db:create db:migrate`
* Seed data (optional): `rails db:seed`
* Start server: `rails s`
* Access endpoints from `http://127.0.0.1:3000`

#### User facing endpoints
* Create new user - [POST] `/users`
* Login existing user - [POST] `/auth/login`
* Fetch all alerts for user - [GET] `/alerts/index?page=<x>&per_page=<y>&status=<some_status>`
* Create new alert - [POST] `/alerts/create?sym=<coin_sym>&price=<coin_price>`
* Delete alert by id - [DELETE] `/alerts/:id`

#### TODO
* Add rake task to listen to binance websocket via faye-websocket client and send message to price controller

#### NOTE
`docker-compose.yml` is present but untested. You can try running with `docker-compose up` after specifying `POSTGRES_USER` and `POSTGRES_PASSWORD` in `.env`.