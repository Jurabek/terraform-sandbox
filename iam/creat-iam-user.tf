resource "aws_iam_user" "dynamodb_user" { 
    name = "dynamodb-executor-user"   
}

resource "aws_iam_access_key" "dynamodb_user" {
  user    = aws_iam_user.dynamodb_user.name
}

resource "aws_iam_user_policy_attachment" "dynamodb_user-dyn-db-full-access" {
  user       = aws_iam_user.dynamodb_user.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}
