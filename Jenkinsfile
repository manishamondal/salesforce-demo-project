node {
    def ANT_HOME = tool name: 'ANT_HOME', type: 'hudson.tasks.Ant$AntInstallation'

    stage('Checkout') {
        checkout([$class: 'GitSCM',
            branches: [[name: '*/main']],
            userRemoteConfigs: [[url: 'https://github.com/your-org/salesforce-jenkins-ant.git']]
        ])
    }

    stage('Build & Package') {
        echo "Running Ant build & package..."
        withEnv(["PATH+ANT=${ANT_HOME}/bin"]) {
            sh """
                ant -version
                ant package
            """
        }
    }

    stage('Archive Artifact') {
        echo "Archiving package.zip..."
        archiveArtifacts artifacts: 'dist/package.zip', fingerprint: true
    }
}
