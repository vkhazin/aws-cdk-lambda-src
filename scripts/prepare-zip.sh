echo ${CODEARTIFACT_DOMAIN}
echo ${CODEARTIFACT_REPOSITORY}
echo ${CODEARTIFACT_PACKAGE}
echo ${CODEARTIFACT_VERSION}

rm -rf ./dist
mkdir ./dist

aws codeartifact get-package-version-asset --domain ${CODEARTIFACT_DOMAIN} --repository ${CODEARTIFACT_REPOSITORY} --format pypi --package ${CODEARTIFACT_PACKAGE} --package-version ${CODEARTIFACT_VERSION} --asset ${CODEARTIFACT_PACKAGE}-${CODEARTIFACT_VERSION}.tar.gz ./dist/${CODEARTIFACT_PACKAGE}.tar.gz

mkdir -p ./dist/${CODEARTIFACT_PACKAGE}
tar -xvzf ./dist/${CODEARTIFACT_PACKAGE}.tar.gz -C ./dist/${CODEARTIFACT_PACKAGE}
EXTRACTED_CODE_DIR=./dist/${CODEARTIFACT_PACKAGE}/${CODEARTIFACT_PACKAGE}-${CODEARTIFACT_VERSION}/src/${CODEARTIFACT_PACKAGE}
ls -r ${EXTRACTED_CODE_DIR}

. ./.venv/bin/activate
python3 -m pip install -r ${EXTRACTED_CODE_DIR}/requirements.txt -t ${EXTRACTED_CODE_DIR}
deactivate

ROOT_DIR=$(pwd)
cd ${EXTRACTED_CODE_DIR}
zip -r ${ROOT_DIR}/dist/${CODEARTIFACT_PACKAGE}.zip ./
cd ${ROOT_DIR}

