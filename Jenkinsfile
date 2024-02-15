pipeline {
    agent any
    
    stages {
        stage('Clone') {
            steps {
                // Checkout your source code from version control
                git 'https://github.com/Kiran-dehlikar/HaProxy.git'
            }
        }
        
        stage('Terraform Init') {
            steps {
                // Change directory to the infra folder
                dir('infra') {
                    // Initialize Terraform
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                // Change directory to the infra folder
                dir('infra') {
                    // Generate an execution plan
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                // Change directory to the infra folder
                dir('infra') {
                    // Apply the changes
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }

        // stage('Terraform Destroy') {
            // steps {
                // Change directory to the infra folder
                //dir('infra') {
                   // Destroy the infrastructure (optional)
                    // sh 'terraform destroy -auto-approve'
                //}
            // }
        // }
    }
}
