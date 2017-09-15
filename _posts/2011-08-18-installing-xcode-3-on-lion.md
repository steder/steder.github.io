---
layout: post
title: "Installing Xcode 3 on Lion"
date: 2011-08-18
comments: false
categories:
 - programming
 - mac

---
Much thanks to
[AnatomicWax](http://anatomicwax.tumblr.com/post/8064949186/installing-xcode-3-2-6-on-lion-redux)!

Just reposting here:

 - Mount the Xcode 3.2.6 DMG
 - Open Terminal
 - Enter the command: `export COMMAND\_LINE\_INSTALL=1`
 - Enter the command: `open “/Volumes/Xcode and iOS SDK/Xcode and iOS SDK.mpkg”`

And on a related note, when I screwed up experimenting with Xcode3 and 4
removing them became an issue: [This mac developer
tip](http://macdevelopertips.com/xcode/how-to-uninstall-xcode.html) worked
like a charm though:

```
sudo <Xcode>/Library/uninstall-devtools --mode=all
```
