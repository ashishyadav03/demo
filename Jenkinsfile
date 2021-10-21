pipeline {
    agent any

    
    stages {
        stage('Build Application') {
            steps {
                echo 'Building'
                 withmaven(maven : 'maven_3_8_3'){
                    bat 'mvn clean compile'
                }
                
            }
        }   
        stage('Test Application') {
            steps {
                echo 'Testing'
                withmaven(maven : 'maven_3_8_3'){
                    bat 'mvn test'
                }
            }
        }

stage('Deploy Application') {
            steps {
                echo 'Deploying'
                withmaven(maven : 'maven_3_8_3'){
                    bat 'mvn deploy'
                }
            }
        }
    }
}
