---
layout: post
title: "Git Pre-commit Hook For Python now with extra
Python!"
date: 2011-09-13
comments: false
categories:
 - pyflakes
 - git
 - python

---

After reading a post by [Bryce Verdier](http://scrollingtext.org/git-pre-commit-python-syntax),
and inspired by comments that suggested the Python version of said hook
script would not be as nice as the bash version I decided to hack up a
quick python version of the same script using
[pyflakes](http://pypi.python.org/pypi/pyflakes) instead of
[pylint](http://www.logilab.org/857).

```
#!/usr/bin/env python
#-*- mode: python -*-
from subprocess import Popen, PIPE
import sys
syntax_checker = "pyflakes"


def run(command):
    p = Popen(command.split(), stdout=PIPE, stderr=PIPE)
    p.wait()
    return p.returncode, p.stdout.read().strip().split(), p.stderr.read()


_, files_modified, _= run("git diff-index --name-only HEAD")
for fname in files_modified:
    if fname.endswith(".py"):
        print >>sys.stderr, "Checking syntax on %s: ... "%(fname,),
        exit_code, _, errors = run("%s %s"%(syntax_checker, fname))
        if exit_code != 0:
            print >>sys.stderr, "\rChecking syntax on %s: FAILED! \n%s"%(fname, errors)
            sys.exit(exit_code)
        else:
            print >>sys.stderr, "\rChecking syntax on %s: OK!"%(fname,)
```

You can download / fork this [here](https://gist.github.com/1214061) if
would like to give it a try:
[https://gist.github.com/1214061](https://gist.github.com/1214061) And
of course, if you're like me and you have no idea what to do with this
script you can just do the following:

```
cp pre-commit.py YourGitProject/.git/hooks/pre-commitchmod +x YourGitProject/.git/hooks/pre-commit
```

It's also worth noting that this version is currently really strict.
**ANY** warnings will cause your commit to fail.  Of course, replacing
pyflakes with pylint again is a simple modification of the
syntax_checker variable in the above script.
