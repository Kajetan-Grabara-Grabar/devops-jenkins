pipeline {
    agent any

    environment {
        DOCKER_HUB_PASSWORD = credentials('DOCKER_HUB_PASSWORD')
    }

    stages {
        stage('Clear running apps') {
            steps {
                sh 'docker rm -f devops_flask_app || true'
                //sh "docker run --rm -d --group-add $(stat -c '%g' /var/run/docker.sock) -v /var/run/docker.sock:/var/run/docker.sock -P jenkins-docker"
            }
        }
        stage('Build Docker Image') {
            steps {
                
                sh "docker build -t devops_flask_app:${BUILD_NUMBER} -t devops_flask_app:latest ."
            }
        }
        stage('Run app') {
            steps {
                sh "docker run -d -p 0.0.0.0:5555:5555 --name devops_flask_app -t devops_flask_app:${BUILD_NUMBER}"
            }
        }
        stage('Upload backend Docker Image to Docker Hub') {
            steps {
                sh "docker login -u kajetangrabaragrabar -p ${DOCKER_HUB_PASSWORD}"
                sh "docker tag devops_flask_app:${BUILD_NUMBER} kajetangrabaragrabar/devops_flask_app:${BUILD_NUMBER}"
                sh 'docker tag devops_flask_app:latest kajetangrabaragrabar/devops_flask_app:latest'
                sh "docker push kajetangrabaragrabar/devops_flask_app:${BUILD_NUMBER}"
                sh 'docker push kajetangrabaragrabar/devops_flask_app:latest'
            }
        }
    }
}
