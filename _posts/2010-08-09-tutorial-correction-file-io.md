---
layout: post
title: "Tutorial Correction: File IO"
date: 2010-08-09
comments: false
categories:
- tutorial
- python
---

<div class='post'>
    8 years ago, thinking I knew a lot about Python, I wrote up this Python tutorial and presented it to some folks at
    my school in an effort to learn Python better and evangelize my favorite programming language.<br /><br />After all
    this time I think I've learned a lot more about Python but the more I learn the more I realize how unprepared I was
    to write this tutorial. &nbsp;Basically, what I'm saying is that I made some mistakes.<br /><br />Since making
    mistakes is the way software gets done I suppose it isn't the end of the world but I digress...<br /><br />Today I'm
    correcting a mistake in the Python tutorial about buffered / non-buffered IO.<br /><br />Basically, 2002-me made the
    mistake of assuming that all file operations were unbuffered because the heavily customized <a
        href="http://www.gentoo.org/">gentoo</a> environment he was writing all the tutorial stuff on at the time was
    defaulting to unbuffered IO. &nbsp;This is a pretty big oversight that makes some tutorial examples non-functional
    for folks out there with an operating system that buffers IO by default (Mac OS X, probably other BSDs, I'm sure
    some flavors of Linux, etc). <br /><br />Anyway, I've updated the tutorial page<a
        href="http://www.penzilla.net/tutorials/python/fileio/"> here </a>with better info about why that example works
    the way it does, the way to make it work if your platform defaults to buffered IO, and the right way (hint: <a
        href="http://docs.python.org/reference/compound_stmts.html#with">with keyword</a>) to write your program so that
    it doesn't rely on the corner case my linux platform example relies on.</div>