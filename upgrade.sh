#!/bin/bash

brew update && brew upgrade && brew cask upgrade && brew cleanup && brew doctor
mas upgrade
