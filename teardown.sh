removeParameter() {
    echo "Removing parameter $1 from parameter store..."
    aws ssm delete-parameter \
        --name $1
}

removeParameter /code-pipeline/notifications/email/primary-email

removeParameter /code-pipeline/builder/github/user

removeParameter /code-pipeline/sources/github/repo

removeParameter /code-pipeline/sources/github/branch

removeParameter /code-pipeline/notifications/slack/workspace-id

removeParameter /code-pipeline/notifications/slack/channel-id

pushd bar-service-infrastructure
echo "Tearing down the infrastructure from AWS..."
npm run cdk destroy
popd
