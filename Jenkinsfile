#!/bin/sh
pipeline{
agent any
  options{
    buildDiscarder logRotator(artifactDaysToKeepStr:'',artifactNumToKeepStr:'15',daysToKeepStr:'',numToKeepStr:'15')
  }
stages{
stage('Build'){
steps{
sh 'cd build'
sh 'cmake -DCMAKE_BUILD_TYPE=PROFILE src/'
}
}
stage('test'){
steps{
sh 'cd build'
sh 'make'
sh 'ctest'
}
}
stage('run'){
steps{
sh 'cd build'
sh './runTests --gtest_output="xml:src/runTests.xml"'
sh './code_coverage'
sh './test_coverage --gtest_output="xml:src/test_coverage.xml"'
}
  post{
    success{
      xunit(
        tools: [ GoogleTest(pattern: '**/*.xml') ]
      )
                }
                }
}
        
      
stage('reports'){
steps{
sh 'cd build'
sh 'gcovr -r src/ .'
sh 'gcovr --cobertura > coverage.xml'
junit 'coverage.xml'
}
}
}
}

