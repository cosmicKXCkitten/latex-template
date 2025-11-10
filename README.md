# LaTex in Docker Template
This template is designed to simplify installation and work with the LaTex ecosystem across any platform and build, as well as to unify work on LaTex documents for large teams.

## Getting started
To start working with this template, you must have the following components installed on your system:
1. Docker (or Docker Desktop for MacOS). You can check its presence with the following command:
```
$ docker --version
Docker version 28.1.1
```
2. Git VCS. You can check its presence with the following command:
```
$ git --version
git version 2.48.1
```
3. Utility `make` for working through interfaces defined in a `Makefile`. You can check its presence with the following command:
```
$ make --version
GNU Make 3.81
```
4. Any code editor (VS Code recommended).

## Install
Install the repository using the `git clone` command via SSH:
```
$ git clone git@github.com:cosmicKXCkitten/latex-template.git
```
or you can simply download the zip archive through the GitHub interface, unzip it, and then open it in your code editor (VS Code is recommended).

## Quick start
Before you start working with a LaTex project, you need to run the LaTex compiler in a Docker container using the following command:
```
$ make run
```
Now you can create your own LaTex document structure or use a template in `/src` directory. You will find the compilation result in the `/dist` directory.
Once you are done with your work, stop monitoring changes and turn off the LaTex compiler using the following command:
```
$ make stop
```
