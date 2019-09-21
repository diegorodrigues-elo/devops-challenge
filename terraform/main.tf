provider "aws" {
  region = "us-east-1"
}

variable "max_availability_zones" {
  default = "2"
}

data "aws_availability_zones" "available" {}

module "build" {
    source              = "git::https://github.com/cloudposse/terraform-aws-cicd.git?ref=master"
    namespace           = "elo"
    stage               = "dev"
    name                = "devops-challenge"

    # Enable the pipeline creation
    enabled             = true

    # Elastic Beanstalk
    app                 = "devops-challenge"
    env                 = "dev"

    # Application repository on GitHub
    github_oauth_token  = "f594ddee12e6d8b37e4c3be01081b8cdcf7ca984"
    repo_owner          = "leonrado"
    repo_name           = "devops-challenge"
    branch              = "leonardo-dias"

    # http://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref.html
    # http://docs.aws.amazon.com/codebuild/latest/userguide/build-spec-ref.html
    build_image         = "aws/codebuild/standard:2.0"
    build_compute_type  = "BUILD_GENERAL1_SMALL"

    # These attributes are optional, used as ENV variables when building Docker images and pushing them to ECR
    # For more info:
    # http://docs.aws.amazon.com/codebuild/latest/userguide/sample-docker.html
    # https://www.terraform.io/docs/providers/aws/r/codebuild_project.html
    privileged_mode     = true
    aws_region          = "us-east-1"
    aws_account_id      = "617532175100"
    image_repo_name     = "ecr-repo-name"
    image_tag           = "latest"

    # Optional extra environment variables
    environment_variables = [{
      name  = "ELO_PASS"
      value = "8JUmMkZj6pY23QAFRqNxfbhBtnrsKwWoDSdvTaCg9iHuL"
    },
    {
      name = "TIME_ZONE"
      value = "America/Sao_Paulo"
   }]
}
