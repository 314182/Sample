#!/bin/sh
pipeline{
agent any
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
sh './runTests --gtest_output="xml:src/'
sh './code_coverage'
sh './test_coverage --gtest_output="xml:src/'
}
}
  post{
    success{
      xunit(
        thresholds: [skipped(failurethreshold= '0'),failed(failurethreshold= '0')],
        tools: [BoostTest(pattern: 'src/*.xml')])
                }
                }
        
      
stage('reports'){
steps{
sh 'gcovr -r src/'
sh 'gcovr --sonarqube > coverage.xml'
}
}
}
}

