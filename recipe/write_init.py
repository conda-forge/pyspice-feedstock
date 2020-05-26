"""
Create __init__.py this way instead of running tasks.release.update_git_sha(),
which doesn't work because we're not using a git repo.
"""
import os
import sys

version = sys.argv[1]

with open('PySpice/__init__.py.in', 'r') as f:
    contents = f.read()
os.unlink('PySpice/__init__.py.in')

contents = contents.replace("@VERSION@", version)
contents = contents.replace("@GIT_TAG@", "v" + version)
contents = contents.replace("@GIT_SHA@", "UNSPECIFIED")

with open("PySpice/__init__.py", 'w') as f:
    f.write(contents)
