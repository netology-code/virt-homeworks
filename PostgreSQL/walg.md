# Wal-g

Backup and restore PostgreSQL with wal-g and file storage access by ssh

### Prepare stand
```shell
$ ansible-playbook -i inventories/dev -l psql pg_db_install.yml
$ ansible-playbook -i inventories/dev walg_install.yml
```

### Change Postgres password if you need
```sql
alter user postgres with password 'password';
```

### Prepare test data
```sql
\c sampledb;
CREATE TABLE sample_table(created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW());
```

### Generate Sample data

generate.sh
```text
#!/bin/bash
# postgres
while true; do
psql -U postgres -d sampledb -c "INSERT INTO sample_table(created_at) VALUES (CURRENT_TIMESTAMP);"
sleep 10;
done
```

### Get sample data
```sql
\c sampledb;
select * from sample_table;
```

### Net wal segment
```sql
select pg_switch_wal();
```

### Generate large table
```sql
\c sampledb;
CREATE TABLE large_table (num1 bigint, num2 double precision, num3 double precision);

INSERT INTO large_table (num1, num2, num3)
  SELECT round(random()*10), random(), random()*142
  FROM generate_series(1, 20000000) s(i);
```

### Create wal-g full backup
```shell
$ PGHOST=d00psql-walg0001 PGPORT=5432 PGUSER=postgres PGPASSWORD=wGLTQ3Dd0Mfvp1MZ wal-g --config /etc/walg.d/.walg.json backup-push --full
```

### List backups
```shell
$ wal-g --config /etc/walg.d/.walg.json backup-list --detail
```

### Verify wal's
```shell
$ wal-g --config /etc/walg.d/.walg.json wal-verify [timeline | integrity]
$ wal-g --config /etc/walg.d/.walg.json wal-show
```

### Restore backup
```shell
$ systemctl stop postgresql-12
$ rm -fr /var/lib/pgsql/12/data/*
$ su postgres
$ wal-g --config /etc/walg.d/.walg.json backup-fetch /var/lib/pgsql/12/data LATEST
$ chmod 0750 /var/lib/pgsql/12/data
$ touch /var/lib/pgsql/12/data/recovery.signal
$ echo "recovery_target_time = '2022-12-07 20:46:30'" > /var/lib/pgsql/12/data/postgresql.auto.conf
$ systemctl start postgresql-12
```

### Force remove wal's
```shell
$ /usr/pgsql-12/bin/pg_resetwal /var/lib/pgsql/12/data -f
```

### Links

* [WAL-G: бэкапы и восстановление СУБД PostgreSQL](https://clck.ru/32nJJa)
* [WAL-G at GitHub.com](https://clck.ru/32MeKc)
* [WAL-G PostgreSQL usage](https://clck.ru/32nJQR)