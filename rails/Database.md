# postgresql mysql 違い
- Postgresは、複雑なクエリや大規模なデータベースを扱うことができる機能豊富なデータベースです。<br>
- 高機能、堅牢性<br>
- MySQLは、設定や管理が比較的簡単で速い上、信頼性が高く、ナレッジが普及しているシンプルなデータベースです。<br>
- 高速に動作すること。複雑な処理や厳格な処理は積極的にサポートしない。<br>

# データベースをSQLiteからPostgresqlに変更する
※業務では、SQLiteは使うとことないので、基本最初からPostgresqlかMySQLを使う<br>
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
