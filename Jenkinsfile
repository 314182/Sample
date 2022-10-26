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
sh './coverage'
}
}
stage('reports'){
steps{
sh 'gcovr'
}
}
}
}

