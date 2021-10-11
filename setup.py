import setuptools

with open("README.md") as fp:
    long_description = fp.read()

setuptools.setup(
    name="lambda-function",
    version="1.0.1",
    description="A small lambda package",
    long_description=long_description,
    long_description_content_type="text/markdown",
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    package_dir={"": "src"},
    packages=setuptools.find_packages(where="src"),
    install_requires=[
        "datetime"
    ],
    python_requires=">=3.6",
)