pipeline {
    agent any

    tools{
        maven "MAVEN_HOME"
    }
    stages {
        stage('Build Application') {
            steps {
                echo 'Building'
                
                git 'https://github.com/ashishyadav03/demo.git'
                
                 bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }
        }   
    }
}
