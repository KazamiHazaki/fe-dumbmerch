def secret = 'aziz'
def server = 'aziz@103.67.186.181'
def directory = 'fe-dumbmerch'
def branch = 'master'
def container = 'dumbmerch-fe'


pipeline{
    agent any

    stages{
        stage ('delete & git pull'){
            steps{
                sshagent([secret]) {
                    sh """ssh -tt -o StrictHostKeyChecking=no ${server} << EOF
                    cd ${directory}
                    docker-compose stop ${container}
                    docker container prune -f
                    git pull origin ${branch}
                    exit
                    EOF"""
                }
            }
        }
        stage ('dockerize app'){
            steps{
                sshagent([secret]) {
                    sh """ssh -tt -o StrictHostKeyChecking=no ${server} << EOF
                    cd ${directory}
                    docker build -t kazamisei98/dumbmerch-fe-slim:0.1 .
                    exit
                    EOF"""
                }
            }
        }
        stage ('deploy app '){
            steps{
                sshagent([secret]) {
                    sh """ssh -tt -o StrictHostKeyChecking=no ${server} << EOF
                    cd ${directory}
                    docker-compose up -d
                    exit
                    EOF"""
                }
            }
        }

           stage ('upload image to dockerhub '){
            steps{
                sshagent([secret]) {
                    sh """ssh -tt -o StrictHostKeyChecking=no ${server} << EOF
                    cd ${directory}
                    docker push kazamisei98/dumbmerch-fe-slim:0.1
                    exit
                    EOF"""
                }
            }
        }


        stage('Push Notification ') {

steps {

     sshagent([secret]) {
                    sh """ssh -tt -o StrictHostKeyChecking=no ${server} << EOF
                    curl -s -X POST https://api.telegram.org/bot6033722165:AAFqBd0-IxtZW4MacIekfTvzql1qLdRCbCk/sendMessage -d chat_id=6192024733 -d text='Build Frontend Complete Bang'
                    EOF"""

                }
    }   
}
    }
}