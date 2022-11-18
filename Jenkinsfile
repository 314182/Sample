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
  cmake -DCMAKE_BUILD_TYPE=PROFILE ../src
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
cd bld_dir
./runTests --gtest_output="xml:../src/runTests.xml"
./c_coverage
./t_coverage --gtest_output="xml:../src/test_coverage.xml"
"""
}
  post{
    success{
      xunit checksName:'',tools:[GoogleTest(excludesPattern:'**/src/coverage.xml', pattern:'**/src/*.xml', stopProcessingIfError:true)]
                }
                }
}
        
      
stage('reports'){
steps{
sh """
cd bld_dir
gcovr -r ../src .
gcovr --xml-pretty -r ../src . > ../src/coverage.xml
"""
cobertura autoUpdateHealth:false,autoUpdateStability:false,coberturaReportFile:'**/src/coverage.xml',conditionalCoverageTargets:'70,0,0',failUnhealthy:false,failUnstable:false,lineCoverageTargets:'80,0,0',onlyStable:false,'sourceEncoding:'ASCII',zoomCoverageChart:false
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

