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
        
        stage('Terraform Format') {
            steps {
                // Change directory to the infra folder
                dir('infra') {
                    // Format Terraform configuration files
                    sh 'terraform fmt'
                }
            }
        }
        
        stage('Terraform Validate') {
            steps {
                // Change directory to the infra folder
                dir('infra') {
                    // Validate Terraform code
                    sh 'terraform validate'
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
        stage('apply or destroy') {
            steps {
                // Prompt for user input
                input message: 'Do you want to run apply or destroy?', parameters: [
                    choice(name: 'STAGE_CHOICE', choices: ['apply', 'destroy'], description: 'Select the stage to run')
                ]
            }
            post {
                always {
                    // Execute either Stage 3 or Stage 4 based on user choice
                    script {
                        if (params.STAGE_CHOICE == 'apply') {
                            // Execute Stage 3
                            sh 'terraform apply --auto-approve'
                        } else {
                            // Execute Stage 4
                            sh 'terraform destroy --auto-approve'
                        }
                    }
                }
            }
        stage('Running Ansible Roles') {
            input {
                message "Proceed to run Ansible Roles?"
            }
            parallel {
                stage('HaProxy Role') {
                    steps {
                        // Run your first Ansible role
                        sh 'ansible-playbook -i aws_ec2.yml haproxy_setup.yml -v'
                    }
                }
                stage('Nginx Role') {
                    steps {
                        // Run your second Ansible role
                        sh 'ansible-playbook -i aws_ec2.yml nginx_setup.yml -v'
                    }
                }
            }
        }
    }
}
