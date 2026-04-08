
#!/bin/bash
yum update -y
yum install -y httpd

systemctl enable httpd
systemctl start httpd

TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

INSTANCE_ID=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" \
  -s http://169.254.169.254/latest/meta-data/instance-id)

PRIVATE_IP=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" \
  -s http://169.254.169.254/latest/meta-data/local-ipv4)

HOSTNAME=$(hostname)

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>TechCorp Web Server</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            padding-top: 50px;
        }
        .container {
            background: white;
            width: 60%;
            margin: auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 { color: #2c3e50; }
        p { font-size: 18px; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to TechCorp</h1>
        <p><strong>Server Name:</strong> ${server_name}</p>
        <p><strong>Hostname:</strong> $HOSTNAME</p>
        <p><strong>Instance ID:</strong> $INSTANCE_ID</p>
        <p><strong>Private IP:</strong> $PRIVATE_IP</p>
        <p>Apache is installed and running successfully.</p>
    </div>
</body>
</html>
EOF
