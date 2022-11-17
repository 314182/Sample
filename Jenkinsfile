#!/bin/sh
pipeline{
agent any
  options{
    buildDiscarder logRotator(artifactDaysToKeepStr:'',artifactNumToKeepStr:'15',daysToKeepStr:'',numToKeepStr:'15')
  }
stages{
stage('Build'){
steps{
sh """ 
mkdir bld_dir
cd bld_dir
pwd
cmake -DCMAKE_BUILD_TYPE=PROFILE ../src
cmake --build .
"""
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
./runTests --gtest_output="xml:src/runTests.xml"
./c_coverage
./t_coverage --gtest_output="xml:src/test_coverage.xml"
"""
}
  post{
    success{
      junit 'src/runTests.xml'
                }
                }
}
        
      
stage('reports'){
steps{
sh """
cd bld_dir
gcovr -r ../src .
gcovr --xml-pretty -r ../src . > coverage.xml
"""
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

