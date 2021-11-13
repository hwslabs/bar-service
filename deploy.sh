#!/bin/bash

set -e

. service.config

addOrUpdateParameter() {
    echo "Adding paremeter \"$1\" as \"$3\"..."
    aws ssm put-parameter \
        --name $1 \
        --description "$2" \
        --type String \
        --overwrite \
        --value $3
}

createSecretIfNotExists() {
    echo "Checking if secret \"$1\" already exists..."
    count=$(aws secretsmanager list-secrets | jq --arg name $1 -c '[.SecretList[] | select(.Name == $name)] | length')

    if [ "$count" -lt 1  ]
    then
        echo "Secret does not exist..."
        echo "Creating secret \"$1\" to be used in the pipeline..."
        aws secretsmanager create-secret \
            --name $1 \
            --description "$2" \
            --secret-string $3
    else
        echo "Secret already exists. Not creating a new replica..."
    fi
}

addOrUpdateParameter /code-pipeline/notifications/email/primary-email "Email address for primary recipient of Pipeline notifications" $PRIMARY_EMAIL_ADDRESS

addOrUpdateParameter /code-pipeline/builder/github/user "Github user to be used for building the code in the pipeline" $GITHUB_USER

addOrUpdateParameter /code-pipeline/sources/github/repo "Github repository name that contains the build sources for the pipeline" $GITHUB_REPO

addOrUpdateParameter /code-pipeline/sources/github/branch "Github branch name that contains the build sources for the pipeline" $GITHUB_BRANCH

createSecretIfNotExists /code-pipeline/builder/github/oauth-token "OAuth token to use for Github API access in the pipeline" $GITHUB_TOKEN

createSecretIfNotExists /code-pipeline/builder/github/ssh-private-key "Base64 encoded Github SSH private key to use during install phase of the build" $GITHUB_SSH_PRIVATE_KEY_BASE64

createSecretIfNotExists /code-pipeline/builder/github/ssh-public-key "Github SSH public key to use during install phase of the build" $GITHUB_SSH_PUBLIC_KEY
