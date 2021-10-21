pipeline {
    agent any 
tools {
        maven 'maven_3_8_3' 
    }
    
    stages {
        stage('Build Application') {
            steps {
                echo 'Building'
                 
                    bat 'mvn clean compile'
                
                
            }
        }   
        stage('Test Application') {
            steps {
                echo 'Testing'
                
                    bat 'mvn test'
                
            }
        }

stage('Deploy Application') {
            steps {
                echo 'Deploying'
                
                    bat 'mvn deploy'
                
            }
        }
    }
}
