# PostgreSQL & pgAdmin Docker Compose Setup Guide

This guide details the setup and configuration for running PostgreSQL with automated backups and pgAdmin for database management, all within Docker containers. This setup is ideal for development, testing, and production environments with the appropriate security considerations.

## Docker Compose Configuration Overview

The `docker-compose.yml` file defines three services: `postgres`, `backup`, and `pgadmin`. Below is a breakdown of the configurations for each service.

### PostgreSQL Service (`postgres`)

- **Image**: Uses the `postgres:15` image, specifying version 15 of PostgreSQL.
- **Container Name**: Names the container `postgres` for easy reference.
- **Environment Variables**:
  - `POSTGRES_USER`: Sets the default PostgreSQL user. Here, it's `postgres`.
  - `POSTGRES_DB`: Specifies the default database created upon startup, named `postgres`.
  - `POSTGRES_PASSWORD`: The password for the `postgres` user, sourced from the `.env` file for security.
- **Volumes**:
  - Maps `./postgres-data` on the host to `/var/lib/postgresql/data` in the container for persistent storage of database files.
  - Mounts configuration files (`postgresql.conf`, `pg_hba.conf`, `pg_ident.conf`) from the host into the container for custom PostgreSQL configurations.
  - Links `./postgres-backups` directory for storing database backups.
- **Ports**: Exposes PostgreSQL on port `5432`, making it accessible on the host at the same port.
- **Healthcheck**: Uses `pg_isready` to check database availability every 10 seconds, timing out after 5 seconds, with 5 retries before marking unhealthy.
- **Command**: Overrides the default command to ensure PostgreSQL uses the provided configuration file.
- **Restart Policy**: `unless-stopped` ensures the container automatically restarts unless it has been explicitly stopped.

### Backup Service (`backup`)

- **Image**: Utilizes `prodrigestivill/postgres-backup-local` for managing PostgreSQL backups.
- **Container Name**: Identified as `backup` for simplicity.
- **Dependencies**: Specifies that it depends on the `postgres` service, ensuring it starts after the database is available.
- **Environment Variables**:
  - `POSTGRES_HOST`, `POSTGRES_DB`, `POSTGRES_USER`, `POSTGRES_PASSWORD`: Database connection details, including the host (`postgres`), database name, user, and password (sourced from `.env`).
  - `BACKUP_KEEP_DAYS`, `BACKUP_KEEP_WEEKS`, `BACKUP_KEEP_MONTHS`: Configures backup retention policies.
  - `HEALTHCHECK_PORT`: An intended port for health checks, though not directly applicable in this service context.
- **Volumes**: Maps `./postgres-backups` to `/backups` in the container for storing backup files.
- **Restart Policy**: Set to `unless-stopped` to ensure continuous operation.

### pgAdmin Service (`pgadmin`)

- **Image**: Uses `dpage/pgadmin4:latest`, ensuring the latest version of pgAdmin 4.
- **Container Name**: Named `pgadmin` for straightforward reference.
- **Environment Variables**:
  - `PGADMIN_DEFAULT_EMAIL`, `PGADMIN_DEFAULT_PASSWORD`: Credentials for logging into pgAdmin, defined in the `.env` file.
  - `PGADMIN_CONFIG_ENHANCED_COOKIE_PROTECTION`: Disables enhanced cookie protection for troubleshooting purposes. **Caution**: Setting this to `'False'` may reduce security; use with care and consider enabling it in production.
- **Dependencies**: Indicates a dependency on the `postgres` service.
- **Volumes**:
  - Ensures pgAdmin's data and configurations are persistent across restarts by mapping `./pgadmin-data` to `/var/lib/pgadmin`.
  - Specifically maps `./pgadmin-data/storage` for additional pgAdmin storage needs.
- **Ports**: Makes pgAdmin accessible via port `8080` on the host.
- **Restart Policy**: Uses `unless-stopped` to auto-restart except when manually stopped.

## Security and Environmental Configuration

- **Environment Variables**: Store sensitive information like passwords in a `.env` file located at the root of your project directory. This file should not be committed to version control.
- **Volume Permissions**: Ensure that the host directories mapped as volumes (`postgres-data`, `postgres-backups`, `pgadmin-data`) have appropriate permissions set to allow read/write operations by the containers.

Example **.env** file

```bash
# PostgreSQL environment variables
POSTGRES_PASSWORD=YourSecurePostgresPassword

# pgAdmin environment variables
PGADMIN_DEFAULT_EMAIL=your.email@example.com
PGADMIN_DEFAULT_PASSWORD=YourSecurePgAdminPassword
```


## Starting the Services

To launch the services, navigate to the directory containing your `docker-compose.yml` and `.env` files, then run:

```bash
docker-compose up -d
```

## Accessing pgAdmin

Once the services are running, access pgAdmin by navigating to `http://localhost:8080` in your web browser. Log in using the `PGADMIN_DEFAULT_EMAIL` and `PGADMIN_DEFAULT_PASSWORD` you specified in your `.env` file.

## Connecting pgAdmin to PostgreSQL

Within pgadmin

Admin, create a new server connection using the following details:

- **Hostname/address**: `postgres` (the service name in `docker-compose.yml`)
- **Port**: `5432`
- **Username**: `postgres` (or as specified in your `.env` file)
- **Password**: The `POSTGRES_PASSWORD` from your `.env` file

## Conclusion

This guide outlines setting up a PostgreSQL database with pgAdmin and backup functionality using Docker Compose. This setup is designed to be flexible, secure, and suitable for various environments, from development to production, with appropriate security enhancements.
