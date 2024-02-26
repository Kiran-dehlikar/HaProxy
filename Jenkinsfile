pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID     = credentials('kiran_access_key')
        AWS_SECRET_ACCESS_KEY = credentials('kiran_secret_key')
        // AWS_DEFAULT_REGION    = 'us-east-1'
    }
    stages {
        stage('Cloning repo') {
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
                    sh 'terraform plan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                // Change directory to the infra folder
                dir('infra') {
                    // Apply the changes
                    sh 'terraform apply --auto-approve'
                }
            }
        }

        stage('Terraform Destroy') {
            steps {
                // Change directory to the infra folder
                dir('infra') {
                   // Destroy the infrastructure (optional)
                    sh 'terraform destroy --auto-approve'
                }
            }
            input {
              message 'Want to fail the pileline'
            }
        }
        stage('Running Ansible Roles') {
            parallel {
                stage('HaProxy Role') {
                    steps {
                        // Run your first Ansible role
                        sh 'ansible-playbook -i aws_ec2.yml haproxy_setup.yml -vv'
                    }
                }
                stage('Nginx Role') {
                    steps {
                        // Run your second Ansible role
                        sh 'ansible-playbook -i aws_ec2.yml nginx_setup.yml'
                    }
                }
            }
        }
    }
}
