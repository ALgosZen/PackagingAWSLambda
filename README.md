# PackagingAWSLambda
generic approach to package dependencies for Lambda

steps involved
1. create funtion 
2. create s3 bucket to zip the source code and upload the function


#### write function - name whatever 

# init and apply the terraform 
- terraform init
- terraform appy
- terraform destroy (run this when you are done with the exercise)

# invoke lambda from cli
- aws lambda invoke --region=us-west-1 --function-name=hello response.json
# verify response 
- cat response.json
# now modify the function.js and run terraform apply to retrigger the deployment . sequence of commands 
- terraform apply
- aws lambda invoke --region=us-west-1 --function-name=hello response.json
- cat response.json

# now create api gateway version 2. using terraform. AWS API Gateway is a fully managed service that makes it easy for developers to create, publish, maintain, monitor, and secure APIs at any scale.
#### 3-api-gateway.tf
### reference 
- https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_api



