#!/usr/bin/groovy

@Library('shared-pipelines') _

def build = new org.mattermost.BuildCommands()

node('slave3'){
    try {
        stage('Checkout') {
            checkout scm
        }
        stage('Build') {
            sh 'mkdir node_modules'
            sh 'make build || exit 1'
        }
        if(env.BRANCH_NAME == 'master'){
            stage('Deploy') {
                s3Upload(file:'v4/html/index.html', bucket:'api.mattermost.com', path:'/v4/index.html')
                s3Upload(file:'v4/html/static/*', bucket:'api.mattermost.com', path:'/v4/static/')
                s3Upload(file:'v3/html/index.html', bucket:'api.mattermost.com', path:'/v3/index.html')
                s3Upload(file:'v3/html/static/*', bucket:'api.mattermost.com', path:'/v3/static/')
                s3Upload(file:'v4/html/index.html', bucket:'api.mattermost.com', path:'/index.html')
                s3Upload(file:'v4/html/static/*', bucket:'api.mattermost.com', path:'/static/')
            }
        }
    } catch (err) {
        currentBuild.result = 'FAILED'
        build.notifyChat(err)
        throw err
    }
}