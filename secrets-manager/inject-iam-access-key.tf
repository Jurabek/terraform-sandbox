resource "aws_secretsmanager_secret" "dynamodb-user-secrets" {
  name     = "pnc-oem-user-secret"
}

resource "aws_secretsmanager_secret_version" "dynamodb-user-secrets" {
  secret_id     = "dynamodb-user-secret"
  secret_string = jsonencode({
    "AccessKeyId" = "${aws_iam_access_key.pnc-oem-user-access-key.id}"
    "SecretAccessKey" = "${aws_iam_access_key.pnc-oem-user-access-key.secret}"
  })
  depends_on = [
      aws_iam_user.pnc-oem-user
  ]
}