#!/bin/sh
pipeline{
agent any
  options{
    buildDiscarder logRotator(artifactDaysToKeepStr:'',artifactNumToKeepStr:'10',daysToKeepStr:'',numToKeepStr:'10')
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
sh './runTests --gtest_output="xml:src/"'
sh './code_coverage'
sh './test_coverage --gtest_output="xml:src/"'
}
  post{
    success{
      xunit(
//        thresholds: [[$class: 'SkippedThreshold', skipped: XUnitThreshold.setUnstableThreshold("0")],
//                    [$class: 'FailureThreshold', failed: XUnitThreshold.setFailureThreshold("0") ]],
        tools: [ GoogleTest(pattern: '**/*.xml') ]
      )
                }
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

