# Lambda Function for AWS_CDK

## Development

- `python3 -m venv .venv`
- `. ./.venv/bin/activate`
- `python3 -m pip install -r ./src/lambda-function/requirements.txt`


## Package & Publish

* Set environment variables:
```
export CODEARTIFACT_DOMAIN=pall
export CODEARTIFACT_REPOSITORY=apollo
export CODEARTIFACT_PACKAGE="lambda-function"
export CODEARTIFACT_VERSION="1.0.1"

```
[package-n-publish.sh](./scripts/publish-n-package.sh)

## Download and repackage Artifact

[prepare-zip.sh](./scripts/prepare-zip.sh)

## Delete Artifact from Repository

- `aws codeartifact delete-package-versions --domain ${CODEARTIFACT_DOMAIN} --repository ${CODEARTIFACT_REPOSITORY} --format pypi --package ${CODEARTIFACT_PACKAGE} --versions ${CODEARTIFACT_VERSION}`
