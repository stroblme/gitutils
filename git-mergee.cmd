@echo off
git branch
git fetch . %1:%2
git checkout %2
git branch