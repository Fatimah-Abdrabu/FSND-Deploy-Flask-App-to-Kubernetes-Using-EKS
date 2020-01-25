FROM python:3.7.2-slim

COPY . /app
WORKDIR /app

RUN pip install --upgrade pip
RUN pip install flask


ENTRYPOINT ['python', 'app.py']


  set TRUST="{ 'Version': '2012-10-17', 'Statement': [ { 'Effect': 'Allow', 'Principal': { 'AWS': 'arn:aws:iam::%ACCOUNT_ID%:root' }, 'Action': 'sts:AssumeRole' } ] }"


  aws iam create-role --role-name UdacityFlaskDeployCBKubectlRole --assume-role-policy-document "{ \"Version\": \"2012-10-17\", \"Statement\": [ { \"Effect\": \"Allow\", \"Principal\": { \"AWS\": \"arn:aws:iam::681963117154:root\" }, \"Action\": \"sts:AssumeRole\" } ] }" --output text --query 'Role.Arn'


  aws iam put-role-policy --role-name UdacityFlaskDeployCBKubectlRole --policy-name eks-describe --policy-document '{ "Version": "2012-10-17", "Statement": [ { "Effect": "Allow", "Action": [ "eks:Describe*", "ssm:GetParameters" ], "Resource": "*" } ] }'

  kubectl patch configmap/aws-auth -n kube-system --patch "$(type aws-auth-patch.yml)"

aws ssm put-parameter --name JWT_SECRET --value "myjwtsecret" --type SecureString
