resource "aws_iam_user" "dynamodb_user" { 
    name = "dynamodb-executor-user"   
}

resource "aws_iam_access_key" "dynamodb_user" {
  user    = aws_iam_user.dynamodb_user.name
}
