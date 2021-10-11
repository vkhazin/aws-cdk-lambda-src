# Lambda Function for AWS_CDK

## Pre-requisites

- `python3 -m pip install --upgrade build`
- `python3 -m pip install --upgrade twine`

## Package

- `python3 -m build`

## Deploy to CodeArtifact

- `aws codeartifact login --tool twine --domain ${CODEARTIFACT_DOMAIN} --repository ${CODEARTIFACT_REPOSITORY}`
- `twine upload --repository codeartifact dist/*.tar.gz`

## Download and repackage Artifact

- `aws codeartifact get-package-version-asset --domain ${CODEARTIFACT_DOMAIN} --repository ${CODEARTIFACT_REPOSITORY} --format pypi --package ${CODEARTIFACT_PACKAGE} --package-version ${CODEARTIFACT_VERSION} --asset ${CODEARTIFACT_PACKAGE}-${CODEARTIFACT_VERSION}.tar.gz $./dist/{CODEARTIFACT_PACKAGE}.tar.gz`
- 
- `mkdir -p ./dist/${CODEARTIFACT_PACKAGE}`
- `tar -xvzf ./dist/${CODEARTIFACT_PACKAGE}.tar.gz -C ./dist/${CODEARTIFACT_PACKAGE}`
- `ls ./dist/${CODEARTIFACT_PACKAGE}`