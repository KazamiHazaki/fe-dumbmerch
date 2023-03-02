def secret = 'aziz'
def server = 'aziz@103.67.186.181'
def directory = 'fe-dumbmerch'
def branch = 'master'
def container = 'dumbmerch-fe'


pipeline{
    agent any

    stages{
        stage ('delete & git pull'){
            steps {
                sshagent(credentials: ['ssh-credentials-id']) {
                sh '''
                [ -d ~/.ssh ] || mkdir ~/.ssh && chmod 0700 ~/.ssh
                ssh-keyscan -t rsa,dsa example.com >> ~/.ssh/known_hosts
                ssh user@example.com ...
                '''
                }
            }
        }
 
    }
}