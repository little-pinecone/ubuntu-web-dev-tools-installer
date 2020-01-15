# ubuntu-web-dev-tools-installer

![keep growing logo](readme-images/logo_250x60.png)

This project offers a bash script useful when you want to set up your development environment with only one command.

## Getting Started

To clone the repository, run in the command line:
```bash
$ git clone https://github.com/little-pinecone/ubuntu-web-dev-tools-installer.git
```

## Usage

To see all available options type the following command:
```
$ ./install.sh -h
```

To install tools type the following command providing script file names as parameters:
```
$ ./install.sh openjdk nodejs
```

To run only the verification scripts for provided tools run the following command:
```
$ ./install.sh -v openjdk nodejs
```

## Customization