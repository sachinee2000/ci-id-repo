pipeline {
    agent any

    environment {
        IMAGE_NAME = 'ner-flask-api'
        IMAGE_TAG = 'latest'
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out code...'
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                echo 'Installing dependencies...'
                sh 'pip install -r requirements.txt'
                sh 'python -m spacy download en_core_web_sm'
            }
        }

        stage('Run Unit Test (Optional)') {
            steps {
                echo 'You can add unit test execution here.'
                // sh 'pytest tests/'   // if you have test cases
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .'
            }
        }

        stage('Run Docker Container') {
            steps {
                echo 'Running Docker container...'
                sh 'docker run -d -p 8010:8010 --name ner_api ${IMAGE_NAME}:${IMAGE_TAG}'
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed.'
        }
        cleanup {
            echo 'Cleaning up...'
            sh 'docker stop ner_api || true'
            sh 'docker rm ner_api || true'
        }
    }
}
