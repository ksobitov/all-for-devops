### Graylog Installation Guide

This guide provides step-by-step instructions for installing Graylog on an Ubuntu server. Graylog is a powerful log management and analysis tool that helps you to centralize and analyze log data from various sources in real-time.

#### Prerequisites

Before you begin the installation process, ensure you have the following:

- An Ubuntu server (tested on Ubuntu XX.XX)
- Root or sudo privileges on the server

#### Step 1: Update System Packages

```bash
sudo apt update
```

#### Step 2: Set Timezone

Ensure the server's timezone is correctly set:

```bash
sudo timedatectl set-timezone Asia/Tashkent
```

#### Step 3: Install Java

```bash
sudo apt install curl wget apt-transport-https lsb-release gnupg
sudo apt install openjdk-17-jre-headless -y
```

Verify the Java installation:

```bash
java -version
```

#### Step 4: Install MongoDB

```bash
cat /etc/lsb-release
curl -fsSL https://www.mongodb.org/static/pgp/server-6.0.asc | sudo gpg -o /usr/share/keyrings/mongodb-server-6.0.gpg --dearmor
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo systemctl start mongod
sudo systemctl status mongod
```
or

[MongoDB Installation on Ubuntu](https://www.mongodb.com/docs/v6.0/tutorial/install-mongodb-on-ubuntu/)

#### Step 5: Install OpenSearch

```bash
curl -o- https://artifacts.opensearch.org/publickeys/opensearch.pgp | sudo gpg --dearmor --batch --yes -o /usr/share/keyrings/opensearch-keyring
echo "deb [signed-by=/usr/share/keyrings/opensearch-keyring] https://artifacts.opensearch.org/releases/bundle/opensearch/2.x/apt stable main" | sudo tee /etc/apt/sources.list.d/opensearch-2.x.list
sudo apt-get update
sudo apt list -a opensearch
```

#### Step 6: Configure OpenSearch

```bash
sudo -i
```

Generate a random password:

```bash
tr -dc A-Z-a-z-0-9_@#%^-_=+ < /dev/urandom  | head -c${1:-32}
```

Edit environment file and add the generated password:

```bash
vim /etc/environment
```

```plaintext
export OPENSEARCH_INITIAL_ADMIN_PASSWORD=<generated_password>
```

Apply changes:

```bash
source /etc/environment
```

Edit OpenSearch configuration file:

```bash
sudo nano /etc/opensearch/opensearch.yml
```

Add the following configurations:

```yaml
cluster.name: graylog
node.name: ${HOSTNAME}
path.data: /var/lib/opensearch
path.logs: /var/log/opensearch
discovery.type: single-node
network.host: 0.0.0.0
action.auto_create_index: false
plugins.security.disabled: true
indices.query.bool.max_clause_count: 32768
```

Enable JVM options:

```bash
sudo nano /etc/opensearch/jvm.options
```

Update Xms & Xmx settings:

```plaintext
-Xms1g
-Xmx1g
```

Configure kernel parameters:

```bash
sudo sysctl -w vm.max_map_count=262144
echo 'vm.max_map_count=262144' | sudo tee -a /etc/sysctl.conf
```

Enable OpenSearch service:

```bash
sudo systemctl daemon-reload
sudo systemctl enable opensearch.service
sudo systemctl start opensearch.service
sudo systemctl status opensearch.service
```

#### Step 7: Install Graylog

```bash
wget https://packages.graylog2.org/repo/packages/graylog-5.2-repository_latest.deb
sudo dpkg -i graylog-5.2-repository_latest.deb
sudo apt-get update && sudo apt-get install graylog-server 
```

You're correct, I apologize for the oversight. Let's include that step for setting `password_secret` and `root_password_sha2` in the Graylog configuration. Here's the amended Step 8:

#### Step 8: Edit Configuration File

Edit the Graylog configuration file:

```bash
sudo nano /etc/graylog/server/server.conf
```

- Ensure to set `password_secret` and `root_password_sha2`.
- To create your `password_secret`, run the following command:

```bash
< /dev/urandom tr -dc A-Z-a-z-0-9 | head -c${1:-96};echo;
```

- Use the following command to create your `root_password_sha2`:

```bash
sudo -i
echo -n "Enter Password: " && head -1 </dev/stdin | tr -d '\n' | sha256sum | cut -d" " -f1
```

- Add the generated outputs to their respective fields in the configuration file.

- Set `http_bind_address` to the public hostname or IP address.

#### Step 9: Enable Graylog Service

After making the necessary changes, proceed to enable the Graylog service:

```bash
sudo systemctl daemon-reload
sudo systemctl enable graylog-server.service
sudo systemctl start graylog-server.service
sudo systemctl --type=service --state=active | grep graylog
```

#### Step 10: Access Graylog Web Interface

- Access the Graylog web interface using a browser.
- Use the username `admin` and the password obtained from `/var/log/graylog-server/server.log`.

Congratulations! You have successfully installed Graylog on your Ubuntu server. You can now start managing and analyzing your log data efficiently.
