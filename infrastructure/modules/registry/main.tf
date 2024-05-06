resource "aws_ecr_repository" "ecr_repo" {
  name = "awarean-container-repository"
}

output "repo_url" {
  value = aws_ecr_repository.ecr_repo.repository_url
}

output "repo_arn" {
  value = aws_ecr_repository.ecr_repo.arn
}

output "repo_name" {
  value = aws_ecr_repository.ecr_repo.name
}