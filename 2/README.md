> 使用 PostgreSQL & Docker 環境執行

### 步驟

1. 使用 Docker 執行 PostgreSQL 最新版本

`docker run -d --name postgres-demo postgres`

2. 進入 container 內

`docker exec -it postgres-demo bash`

3. 進入 postgresQL 的 psql 內

`psql -U postgres`

4. 將 table.sql 內的內容複製貼上即可！

### 說明

* primary key 我都是使用整數 id，所以廠房ID、感測器ID、感應器ID 我都取名為 code
