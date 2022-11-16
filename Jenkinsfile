#!/bin/sh
pipeline{
agent any
  options{
    buildDiscarder logRotator(artifactDaysToKeepStr:'',artifactNumToKeepStr:'15',daysToKeepStr:'',numToKeepStr:'15')
  }
stages{
stage('Build'){
steps{
sh 'mkdir bld_dir'
sh 'cd bld_dir'
sh 'cmake -DCMAKE_BUILD_TYPE=PROFILE ../src'
sh 'cmake --build . '
}
}
stage('test'){
steps{
sh 'cd bld_dir'
sh 'make'
sh 'ctest'
}
}
stage('run'){
steps{
sh 'cd bld_dir'
sh './runTests --gtest_output="xml:src/runTests.xml"'
sh './code_coverage'
sh './test_coverage --gtest_output="xml:src/test_coverage.xml"'
}
  post{
    success{
      junit 'src/runTests.xml'
                }
                }
}
        
      
stage('reports'){
steps{
sh 'cd bld_dir'
sh 'gcovr -r src/ .'
sh 'gcovr --sonarqube -r src/ . > coverage.xml'
}
}
}
}

