variable "jenkins_env_vars" {
  description = "Environment variables to be passed to the Jenkins Docker container."
  default     = ["PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/go/bin:/var/jenkins_home/workspace/bin", "LGOBIN=/var/jenkins_home/workspace/bin", "GOPATH=/var/jenkins_home/workspace", "GOROOT=/usr/local/go"]
  type        = "list"
}