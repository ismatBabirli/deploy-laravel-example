node {
    deleteDir()
    APP_NAME="laravel-docker-demo"
    VERSION="v${env.BUILD_NUMBER}"

    if (env.BRANCH_NAME == 'develop'){
        NAMESPACE='test'
    }
    if (env.BRANCH_NAME == 'master'){
        NAMESPACE='prod'
    }
    if (env.BRANCH_NAME == 'preprod'){
        NAMESPACE='preprod'
    }

    try {
        stage ('Checkout') {
        	checkout scm
        }
        stage ('Build Project') {
//             sh './gradlew clean build -x test --no-daemon --info'
        }
        stage ('Unit & Integration Tests') {
//             try {  //@todo uncomment it after there are at least one unit test
//                sh './gradlew check --no-daemon --info'
//             } finally {
//                 junit '**/build/test-results/test/*.xml'
//             }
        }
        if (env.BRANCH_NAME == 'preprod' || env.BRANCH_NAME == 'develop' || env.BRANCH_NAME == 'master'){
            stage ('Build Image') {
				sh "docker build -t ismatbabir/$APP_NAME:${VERSION} ."
            }

      	    stage ('Push&Clean Image') {
      	        sh "docker login --username ismatbabir --password 'W%PAwJW@w6Ld.^s'"
				sh "docker push ismatbabir/$APP_NAME:${VERSION}"
				sh "docker rmi -f ismatbabir/$APP_NAME:${VERSION}"
		    }

           stage ('deploy') {
               sh "deploy.sh ${NAMESPACE} ${APP_NAME} ${VERSION}"
           }
        }
    } catch (err) {
        throw err
    }
}
