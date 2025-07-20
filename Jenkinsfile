node{
   currentBuild.displayName = "#${env.BUILD_NUMBER}-Initial"
    def mavenhome = tool name: 'maven'
    //checkout stage
    stage('chekoutcode'){
        currentBuild.displayName = "#${env.BUILD_NUMBER}-checkout"
        git 'https://github.com/SURYA-TEJA-BTECH/Greet.git'
    }
    
    //build stage
    stage('build'){
        sh "echo $mavenhome"
          currentBuild.displayName = "#${env.BUILD_NUMBER}-build"
        sh "$mavenhome/bin/mvn clean package"
    }
    
    stage('sonarqubeReport'){
          currentBuild.displayName = "#${env.BUILD_NUMBER}-sonar"
       sh "$mavenhome/bin/mvn sonar:sonar -Dsonar.login=sqa_4b7144b75e48570fd50277b62bd97a7c05da0b61" 
    }

    currentBuild.displayName = "#${env.BUILD_NUMBER}-${currentBuild.result}"
    
}
