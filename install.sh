#!/bin/sh

# Run this to install Git Hooks.
ln -sf ../../scripts/pre-commit.sh .git/hooks/pre-commit
ln -sf ../../scripts/post-commit.sh .git/hooks/post-commit
ln -sf ../../scripts/post-commit.sh .git/hooks/post-update
