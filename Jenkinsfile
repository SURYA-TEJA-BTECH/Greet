node{
    def mavenhome = tool name: 'maven'
    //checkout stage
    stage('chekoutcode'){
        git 'https://github.com/SURYA-TEJA-BTECH/Greet.git'
    }
    
    //build stage
    stage('build'){
        sh "echo $mavenhome"
        sh "$mavenhome/bin/mvn clean package"
    }
    
    stage('sonarqubeReport'){
       sh "$mavenhome/bin/mvn sonar:sonar -Dsonar.login=sqa_4b7144b75e48570fd50277b62bd97a7c05da0b61" 
    }
    
    
}
