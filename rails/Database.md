# postgresql mysql 違い

# データベースをSQLiteからPostgresqlに変更する
- railsは`Gemfile`と`database.yml`を書き換えればデータベースの変更を簡単にすることができる
```
# Gemfile

pg #追加してbundle

```

```
# database.yml
default: &default
  adapter: postgresql
  encoding: unicode
  # For details on connection pooling, see Rails configuration guide
  # http://guides.rubyonrails.org/configuring.html#database-pooling
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
development:
  <<: *default
  database: food_management_development
test:
  <<: *default
  database: food_management_test
production:
  <<: *default
  adapter: postgresql
  encoding: unicode
```
上記のように書き換えて`rails db:create`を実行する
