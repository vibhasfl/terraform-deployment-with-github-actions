## Getting Started

### Connect AWS cloud environment with Github repository
    
Create necessary infra using cloudformation

1. Create OIDC provide for github
    ```sh
    > aws cloudformation create-stack --stack-name $yourstackname --template-body file://roles/oidc.yaml
    ```

2. Create s3 bucket for terraform state storage and role that will used by github actions
     ```sh
    > aws cloudformation create-stack --stack-name $yourstackname --template-body file://roles/terraform-s3-bucket.yaml --parameters file://terraform-s3-bucket.json
    ```

Setup github workflow to test your AWS connection

1. gh variable set IAM_ROLE --env development




