pipeline {
    agent any

    environment {
        DOCKER_REGISTRY = "http://192.168.203.45:80" // Docker Harbor 레지스트리 URL
        DOCKER_Harbor_path = "192.168.203.45:80" // Docker Harbor push 경로
        DOCKER_CREDENTIALS_ID = "admin_harbor" // Jenkins에 등록된 Harbor 자격 증명 ID
        IMAGE_NAME = "nginx-app:2.0" // 이미지 이름 및 태그
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    credentialsId: '14ben',
                    url: 'https://github.com/14ben/clx_test.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    def dockerImage = docker.build("${DOCKER_Harbor_path}/test/${IMAGE_NAME}", "-f Dockerfile .")
                }
            }
        }

        stage('Harbor push') {
            steps {
                script {
                    docker.withRegistry("${DOCKER_REGISTRY}", DOCKER_CREDENTIALS_ID) {
                        //sh "docker tag ${IMAGE_NAME} ${DOCKER_REGISTRY}/test/${IMAGE_NAME}" // 이미지 태그 변경
                         sh "docker push ${DOCKER_Harbor_path}/test/${IMAGE_NAME}" // 이미지를 Docker Harbor에 푸시
                    }
                }
            }
        }

        // 추가 단계 (테스트, 배포 등)는 여기에 추가할 수 있습니다.
    }

    post {
        always {
            cleanWs() // 작업 공간 정리
        }
    }
}

