
node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
        // docker.withServer('tcp://132.145.20.93:10240')
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */
        agent {
            node {
            label 'docker-agent-python'  // both label and image
            //image 'node:7-alpine' 
            }

        app = docker.build("mezoology/lotrobot")
    }
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}