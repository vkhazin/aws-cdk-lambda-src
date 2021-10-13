set -x

python3 -m pip install --upgrade build
python3 -m pip install --upgrade twine

python3 -m build

aws codeartifact login --tool twine --domain ${CODEARTIFACT_DOMAIN} --repository ${CODEARTIFACT_REPOSITORY}
twine upload --repository codeartifact dist/*.tar.gz

