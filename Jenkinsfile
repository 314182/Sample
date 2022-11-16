#!/bin/sh
pipeline{
agent any
  options{
    buildDiscarder logRotator(artifactDaysToKeepStr:'',artifactNumToKeepStr:'15',daysToKeepStr:'',numToKeepStr:'15')
  }
stages{
stage('build'){
steps{
sh 'cmake .'
}
}
stage('test'){
steps{
sh 'make'
sh 'ctest'
}
}
stage('run'){
steps{
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
sh 'gcovr -r src/'
sh 'gcovr --cobertura-pretty > coverage.xml'
junit 'coverage.xml'
}
}
}
}

