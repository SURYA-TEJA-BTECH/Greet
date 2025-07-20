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
       sh "$mavenhome/bin/mvn sonar:sonar -Dsonar.login=sqa_94ccfa7eae3a984d78f8999b6aeb15bb024d6949" 
    }

    currentBuild.displayName = "#${env.BUILD_NUMBER}-${currentBuild.result}"
    
}
