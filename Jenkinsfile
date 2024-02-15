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
                // Initialize Terraform
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                // Generate an execution plan
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                // Apply the changes
                sh 'terraform apply -auto-approve tfplan'
            }
        }

        // stage('Terraform Destroy') {
            // steps {
               // Destroy the infrastructure (optional)
                // sh 'terraform destroy -auto-approve'
            // }
        // }
    }
}