# misskey-backup

定期的にMisskeyのDBをバックアップしてCloudflare R2に投げるやつ。

# 起動方法

1. `.env.example` をコピーして `.env` を作る
1. 必要な情報を入れる
1. `docker compose up -d`

# リストアするには

1. 戻したい地点のバックアップを取ってくる
1. Misskeyを止める
1. DBのディレクトリを複製しておく **(大事)**
1. DBのディレクトリを丸ごと削除する
1. `cat /path/to/backup_file | docker compose exec --no-tty {DBのコンテナ名} psql {DB名} {ユーザー名}`
