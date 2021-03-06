resource "vault_aws_secret_backend" "default" {
  access_key                = var.access_key
  secret_key                = var.secret_key
  default_lease_ttl_seconds = var.default_lease_ttl_seconds
  max_lease_ttl_seconds     = var.max_lease_ttl_seconds
}

resource "vault_aws_secret_backend_role" "default" {
  backend         = vault_aws_secret_backend.default.path
  name            = "deploy"
  credential_type = "iam_user"

  policy_document = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "iam:*",
      "Resource": "*"
    }
  ]
}
EOT
}
