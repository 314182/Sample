#!/bin/sh
pipeline{
agent any
  options{
    buildDiscarder logRotator(artifactDaysToKeepStr:'',artifactNumToKeepStr:'15',daysToKeepStr:'',numToKeepStr:'15')
  }
  environment{
    SONARQUBE_URL = 'http://localhost:9000'
  }
stages{
//  stage('Build-wrapper'){
//    steps{
//      sh '''
//      mkdir -p .sonar
//      curl -sSLo .sonar/build-wrapper-linux-x86.zip ${SONARQUBE_URL}/static/cpp/build-wrapper-linux-x86.zip
//      unzip -o .sonar/build-wrapper-linux-x86.zip -d .sonar/
//      '''
//    }
//  }
      
stage('Build'){
steps{
  sh """ 
  mkdir bld_dir
  cd bld_dir
  pwd
  cmake ..
  cmake --build .

"""
  //.sonar/build-wrapper-linux-x86/build-wrapper-linux-x86-64 --out-dir bw-output cmake --build . --config Release
}
}
stage('test'){
steps{
sh """ 
cd bld_dir
make
ctest
"""
}
}
stage('run'){
steps{
sh """
echo ${env.WORKSPACE}
cd bld_dir
./runTests --gtest_output="xml:../runTests.xml"
./c_coverage
./t_coverage --gtest_output="xml:../test_coverage.xml"
find ${env.WORKSPACE} -name *.gcda 
"""
}
  post{
    success{
      xunit checksName:'',tools:[GoogleTest(excludesPattern:'**/bld_dir/coverage.xml', pattern:'**/*.xml', stopProcessingIfError:true)]
                }
                }
}
        
      
stage('reports'){
steps{
sh """
cd bld_dir
gcovr -r .. .
gcovr --xml-pretty -r /var/lib/jenkins/workspace/Samplegit . > coverage.xml
"""
cobertura autoUpdateHealth:false,autoUpdateStability:false,coberturaReportFile:'bld_dir/coverage.xml',conditionalCoverageTargets:'70,0,0',failUnhealthy:false,failUnstable:false,lineCoverageTargets:'80,0,0',onlyStable:false,sourceEncoding:'ASCII',zoomCoverageChart:false
}
}
  stage('sonar-analysis'){
    steps{
      script{
      scannerHome = tool 'SonarQube Scanner 4.7.0'
      }
      withSonarQubeEnv('Sonar1'){
        sh "${scannerHome}/bin/sonar-scanner"
      }
    }
  }
}
}

