# misskey-backup

定期的にMisskeyのDBをバックアップしてCloudflare R2に投げるやつ。

# 起動方法

1. `.env.example` をコピーして `.env` を作る
1. `crontab.example` をコピーして `crontab` を作る
1. `docker-compose.yml.example` をコピーして `docker-compose.yml` を作る
1. 必要な情報を入れる
1. `docker compose up -d`

# リストアするには

1. 戻したい地点のバックアップを取ってくる
1. `cd misskey`
1. `docker compose down`
1. `cp -r postgres postgres_backup` **(大事)**
1. `rm -rf postgres`
1. `docker compose up -d postgres`
1. `cat {取ってきたバックアップのパス} | docker compose exec --no-tty {DBのコンテナ名} psql {DB名} {ユーザー名}`
