resource "aws_iam_user" "developer" {
  name = var.user_name
}

resource "aws_iam_policy" "developer_eks" {
  name = "AmazonEKSDeveloperPolicy"

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "eks:DescribeCluster",
                "eks:ListClusters"
            ],
            "Resource": "*"
        }
    ]
}
POLICY
}

resource "aws_iam_user_policy_attachment" "developer_eks" {
  user       = aws_iam_user.developer.name
  policy_arn = aws_iam_policy.developer_eks.arn
}

resource "aws_eks_access_entry" "developer" {
  cluster_name      = var.cluster_name
  principal_arn     = aws_iam_user.developer.arn
  kubernetes_groups = var.kubernetes_groups
}


# # Create access keys for the developer IAM user or create them manually.
# resource "aws_iam_access_key" "developer_access_key" {
#   user = aws_iam_user.developer.name

#   # Optional tags for tracking
# #   tags = {
# #     Name = "developer-access-key"
# #   }
# }

# # Output the access and secret keys (You might want to handle them securely)
# output "developer_access_key_id" {
#   value       = aws_iam_access_key.developer_access_key.id
#   description = "Access Key ID for developer user"
# }

# output "developer_secret_access_key" {
#   value       = aws_iam_access_key.developer_access_key.secret
#   description = "Secret Access Key for developer user"
#   sensitive   = true  # Mark it as sensitive to avoid exposing it in Terraform logs
# }


