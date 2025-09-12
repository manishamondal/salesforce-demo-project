node {

    stage('Checkout') {
        checkout([$class: 'GitSCM',
            branches: [[name: '*/main']],
            userRemoteConfigs: [[url: 'https://github.com/manishamondal/salesforce-demo-project.git']]
        ])
    }

    stage('Build & Package') {
        echo "Running Ant build & package..."
        def antHome = tool name: 'Ant', type: 'hudson.tasks.Ant$AntInstallation'
        withEnv([
            "ANT_HOME=${antHome}",
            "PATH+ANT=${antHome}\\bin"
        ]) {
            bat 'ant -version'
            bat 'ant -f build.xml package '
        }
    }

    stage('Archive Artifact') {
        echo "Archiving package.zip..."
        archiveArtifacts artifacts: 'dist/package.zip', fingerprint: true
    }
}
