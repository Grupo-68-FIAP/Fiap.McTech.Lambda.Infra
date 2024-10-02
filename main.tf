/*
resource "aws_iam_role" "lambda_role" {
  name               = "LabRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Effect = "Allow"
        Sid    = ""
      },
    ]
  })
}
*/

/*
resource "aws_iam_policy_attachment" "lambda_logging" {
  name       = "lambda-logging"
  roles      = ["LabRole"] //[aws_iam_role.lambda_role.name]
  policy_arn = "arn:aws:iam::052365638512:role/LabRole" //"arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
*/

resource "aws_lambda_function" "lambda_function" {
  function_name    = "Mctech"
  role             = "arn:aws:iam::052365638512:role/LabRole" //aws_iam_role.lambda_role.arn
  handler          = "index.handler"
  runtime          = "nodejs20.x"
  source_code_hash = filebase64sha256("src/lambda_function.js")
  timeout          = 10
  filename         = "lambda_registry_client.zip"

  environment {
    variables = {
      API_GATEWAY_APPLICATION_PROXY = ""
    }
  }
}