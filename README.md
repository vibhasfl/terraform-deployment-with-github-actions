## Getting Started

### Connect AWS cloud environment with Github repository

#### Create necessary infra using cloudformation

1. Create OIDC provide for github

   ```sh
   > aws cloudformation create-stack --stack-name $yourstackname --template-body file://roles/oidc.yaml
   ```

2. Create s3 bucket for terraform state storage and role that will used by github actions
   ```sh
   > aws cloudformation create-stack --stack-name $yourstackname --template-body file://roles/terraform-s3-bucket.yaml --parameters file://terraform-s3-bucket.json
   ```

#### Set following vars for development environment

1. gh variable set IAM_ROLE --env development

   IAM_ROLE : Arn of that IAM role which has necessary permission to access terraform state bucket and other services as defined in tf files

2. gh variable set SSM_PATH --env development

   SSM_PATH : AWS SSM path where tfvars are stored

#### Workflow details:

1. testing-oidc : This workflow would test wheather github is able to access AWS services

2. tf-deploy-dev : This workflow will be used to deploy to dev environment

3. tf-destroy : This workflow is used to destroy created infrastructure

4. scan-with-trivy : Using Trivy to scan Infrastructure as Code
