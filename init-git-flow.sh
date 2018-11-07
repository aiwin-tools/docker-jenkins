#!/bin/bash -x

# branch config
git config --global gitflow.branch.master production
git config --global gitflow.branch.develop master
#prefixes config
git config --global gitflow.prefix.feature issue/
git config --global gitflow.prefix.bugfix bugfix/
git config --global gitflow.prefix.release release/
git config --global gitflow.prefix.hotfix hotfix/
git config --global gitflow.prefix.support support/
git config --global gitflow.prefix.versiontag v
