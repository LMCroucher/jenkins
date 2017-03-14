provider "docker" {
    host = "tcp://127.0.0.1:2375/"
}

resource "docker_container" "colibri_jenkins" {
    image = "${docker_image.jenkins.latest}"
    name = "jenkins"
    env = ["${concat(var.jenkins_env_vars)}"]
    volumes {
        host_path = "${path.cwd}/jenkins_home/"
        container_path = "/var/jenkins_home/"
    }
    volumes {
        host_path = "/var/run/docker.sock"
        container_path = "/var/run/docker.sock"
    }
    ports {
        internal = "8080"
        external = "80"
    }
    ports {
        internal = "50000"
        external = "50000"
    }
    provisioner "local-exec" {
        command = "docker exec -u root jenkins /var/jenkins_home/provision.sh && docker restart jenkins"
    }
}

resource "docker_image" "jenkins" {
    name = "jenkinsci/jenkins:2.32.3"
}