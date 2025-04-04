resource "aws_eks_node_group" "general" {
  cluster_name    = aws_eks_cluster.eks.name
  version         = var.eksversion
  node_group_name = var.node_group_name
  node_role_arn   = aws_iam_role.nodes.arn
  subnet_ids      = var.subnet_ids
  capacity_type   = var.capacity_type
  instance_types  = var.instance_types

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  remote_access {
    # ec2_ssh_key = file("${path.module}/ssh-key.pub")
    ec2_ssh_key = var.key_name
  }

  update_config {
    max_unavailable = 1
  }

  disk_size = var.disk_size # min 20GB recommended

  labels = {
    role = var.node_group_name
  }

  depends_on = [
    aws_iam_role_policy_attachment.amazon_eks_worker_node_policy,
    aws_iam_role_policy_attachment.amazon_eks_cni_policy,
    aws_iam_role_policy_attachment.amazon_ec2_container_registry_read_only,
  ]

  lifecycle {
    ignore_changes = [scaling_config[0].desired_size]
  }
}

