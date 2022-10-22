# PackagingAWSLambda
generic approach to package dependencies for Lambda

steps involved
1. create funtion 
2. create terraform - to create s3 bucket, create lambda role, zip the source code and upload the function
3. test terraform 
4. create api gateway
5. integrate the api gateway with lambda funtion


#### write function - name whatever 

# init and apply the terraform 
- terraform init
- terraform appy
- terraform destroy (run destroy when you are ready to clean up resources)

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

#### steps :
- create api gateway - api-gateway.tf
- integrate the api gateway with lambda funtion - hello-api-gateway.tf

#### run terraform appy 

### test the HTTP GET (make sure to replace id with the API ID)
- curl "https://<id>.execute-api.us-west-1.amazonaws.com/dev/hello?Name=Vito%20Croleone"
- %20 represents a space in URL - as space is assigned number 32 which is 20 in hexadecimal

### test the POST method (using curl or postman) - 
### (make sure to replace id with the API ID)

-curl -X POST \
-H "Content-Type: application/json" \
-d '{"name":"Vito Corleone"}' \
"https://<id>.execute-api.us-west-1.amazonaws.com/dev/hello"




