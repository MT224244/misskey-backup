# misskey-backup

定期的にMisskeyのDBをバックアップしてCloudflare R2に投げるやつ。

- [misskey](https://github.com/MT224244/misskey)
- misskey-backup
- [misskey-nginx-proxy](https://github.com/MT224244/misskey-nginx-proxy)

# 起動方法

1. `.env.example` をコピーして `.env` を作る
1. `crontab.example` をコピーして `crontab` を作る
1. `docker-compose.yml.example` をコピーして `docker-compose.yml` を作る
1. 必要な情報を入れる
1. `docker compose up -d`

# リストアするには

1. 戻したい地点のバックアップを取ってくる
    1. `cd misskey-backup`
    1. `source .env && docker compose exec backup ./get.sh {yyyyMMddHH}`
1. Misskeyを停止してDBデータ削除
    1. `cd misskey`
    1. `docker compose down`
    1. `cp -r ../misskey-data/misskey/postgres ../misskey-data/misskey/postgres_backup` **(大事)**
    1. `rm -rf ../misskey-data/misskey/postgres`
1. バックアップ地点のデータをリストアしてMisskeyを起動
    1. `docker compose up -d postgres`
    1. `source .config/.env.postgres && cat ../misskey-data/backups/misskey_{yyyyMMddHH}.sql | docker compose exec --no-tty postgres psql $POSTGRES_DB $POSTGRES_USER`
    1. `docker compose up -d`
