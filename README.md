# Python Serverless QR Code Generator


Python project capable to generate QR code images, written in Python, and deployed on AWS Lambda + API Gateway

## Stages

### Python package management

- [Python Poetry](https://python-poetry.org/)


### AWS Lambda

- [Public Lambda Layers Project](https://github.com/keithrozario/Klayers)
- [Public Lambda Layers used for Python 3.9]([https://github.com/keithrozario/Klayers](https://github.com/keithrozario/Klayers/tree/master/deployments/python3.9))


### API Gateway

#### Configuring Binary Media Types

- First command:
```
  aws apigateway update-integration-response --rest-api-id <your_rest_api_id_here_without_the_tags> --resource-id <your_resource_id_here_without_the_tags> --http-method GET --status-code 200 --patch-operations op='replace',path='/responseParameters/method.response.header.Access-Control-Allow-Origin',value='"'"'*'"'"'
```

- Second command:
```
  aws apigateway update-rest-api --rest-api-id <your_rest_api_id_here_without_the_tags> --patch-operations op=replace,path="/binaryMediaTypes/*~1*",value='*~1*'
```
