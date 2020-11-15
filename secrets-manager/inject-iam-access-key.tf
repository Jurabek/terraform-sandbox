resource "aws_secretsmanager_secret" "dynamodb-user-secrets" {
  name     = "dynamodb_user-secret"
}

resource "aws_secretsmanager_secret_version" "dynamodb-user-secrets" {
  secret_id     = "dynamodb-user-secret"
  secret_string = jsonencode({
    "AccessKeyId" = "${aws_iam_access_key.dynamodb_user-access-key.id}"
    "SecretAccessKey" = "${aws_iam_access_key.dynamodb_user-access-key.secret}"
  })
  depends_on = [
      aws_iam_user.dynamodb_user
  ]
}