#!/bin/bash
yum update -y

amazon-linux-extras enable postgresql14
yum clean metadata
yum install -y postgresql postgresql-server

postgresql-setup initdb

systemctl enable postgresql
systemctl start postgresql

sed -i "s/^#listen_addresses = 'localhost'/listen_addresses = '*'/g" /var/lib/pgsql/data/postgresql.conf

cat <<EOF >> /var/lib/pgsql/data/pg_hba.conf
host    all             all             10.0.0.0/16            md5
EOF

sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'TechcorpDB@123';"

systemctl restart postgresql
~                                                                                                                                                                                                                                                                              ~                                    
