resource "aws_secretsmanager_secret" "dynamodb_user_secret" {
  name     = "dynamodb_user_secret"
}

resource "aws_secretsmanager_secret_version" "dynamodb_user_secret_pass_version" {
  secret_id     = "dynamodb_user_secret"
  secret_string = jsonencode({
    "AccessKeyId" = "${aws_iam_access_key.dynamodb_user_access_key.id}"
    "SecretAccessKey" = "${aws_iam_access_key.dynamodb_user_access_key.secret}"
  })
  depends_on = [
      aws_iam_user.dynamodb_user
  ]
}