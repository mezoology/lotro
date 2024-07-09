node {
    def app
    agent {
            
            label 'test'  // both label and image
                // image 'mezoology/jnkns-agent:pydo' 
            
        }
    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm

    }

    stage("Load envVars File") {

           load "/var/jenkins_home/workspace/lotro-bot/source/__init__.py"


    }
    
    stage("Initialization") {
            // use name of the patchset as the build name
            buildName "${__version__}.${env.BUILD_NUMBER}"
            buildDescription "Executed @ ${NODE_NAME} ---- ${__version__}"
            
    }
    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */
       
        app = docker.withRegistry('https://registry.hub.docker.com', 'hub_id') {
            def image = docker.image("mezoology/bot-test")
                sh "docker context create tls"
                sh "docker buildx create --use tls --name multiarch"
                sh """
                docker buildx build \
                    --platform linux/amd64,linux/arm64 \
                    -t ${image.imageName()}:${__version__}.${env.BUILD_NUMBER} \
                    -t ${image.imageName()}:latest \
                    --push .
                    
                """
    }
 
    }
}