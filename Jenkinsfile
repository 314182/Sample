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
}
}
stage('run'){
steps{
sh './runTests'
sh './code_coverage'
sh './test_coverage'
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

