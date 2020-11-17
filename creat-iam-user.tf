resource "aws_iam_user" "dynamodb_user" { 
    name = "dynamodb-executor-user"   
}

resource "aws_iam_access_key" "dynamodb_user_access_key" {
  user    = aws_iam_user.dynamodb_user.name
}

resource "aws_iam_user_policy_attachment" "dynamodb_user_db_full_access" {
  user       = aws_iam_user.dynamodb_user.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}
