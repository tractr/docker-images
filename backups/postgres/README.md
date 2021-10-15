# Using a prepost strategy to create Postgres backups

Volumerize can execute scripts before and after the backup process.

With this prepost strategy you can create a .sql backup of your Postgres containers and save it with Volumerize.

## Environment Variables

Aside of the required environment variables by Volumerize, this prepost strategy will require a couple of extra variables.

| Name              | Description                                                   |
| ----------------- | ------------------------------------------------------------- |
| POSTGRES_USER     | Username of the user who will perform the restore or dump.    |
| POSTGRES_PASSWORD | Password of the user who will perform the restore or dump.    |
| POSTGRES_HOST     | IP or domain of the host machine.                             |
| POSTGRES_PORT     | Port to use. Default: 5432                                    |
| POSTGRES_DB       | Database to backup / restore.                                 |

## Example with Docker Compose

```YAML
version: "2"

services:
  postgres:
    image: postgres:13-alpine
    ports:
      - 5432:5432
    volumes:
      - postgres:/var/lib/postgresql/data/
    environment:
      - POSTGRES_USER=user
      - POSTGRES_PASSWORD=1234
      - POSTGRES_DB=somedatabase

  volumerize:
    build: tractrs-docker-postgres-backup-78c67c3d9d5a
    environment:
      - VOLUMERIZE_SOURCE=/source
      - VOLUMERIZE_TARGET=file:///backup
      - POSTGRES_USER=user
      - POSTGRES_PASSWORD=1234
      - POSTGRES_HOST=postgres
      - POSTGRES_PORT=5432
      - POSTGRES_DB=somedatabase
    volumes:
      - volumerize-cache:/volumerize-cache
      - backup:/backup
    depends_on:
      - postgres

volumes:
  volumerize-cache:
  postgres:
  backup:
```

Then execute `docker-compose exec volumerize backup` to create a backup of your database and `docker-compose exec volumerize restore` to restore it from your backup.

### Notes

You may see this output on restore:

```text
Command was: DROP TABLE public.users;
pg_restore: warning: errors ignored on restore: 1
```

It is only a warning saying that the table to restore did not exist before restore.