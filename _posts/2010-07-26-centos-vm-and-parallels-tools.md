---
layout: post
title: "Centos VM and Parallels Tools"
date: 2010-07-26
comments: false
categories:
- vm
- reference
- parallels
---

<div class='post'>
    I'm currently installing a Centos 5.5 VM for work purposes and I recently ran into the following
    error:<br /><br />"Required GNU/Linux Components Missing: Some Components needed for Parallels Tools installation
    are missing in your system. &nbsp;Do you want to download these components automatically?"<br /><br />The following
    packages can be installed first to avoid having parallels do it for you:<br />
    <ul>
        <li>kernel-headers</li>
        <li>kernel-devel</li>
        <li>gcc</li>
    </ul>
    <div>
        <pre>$ sudo su -<br />$ yum install<br />$ yum install kernel-headers kernel-devel gcc<br /></pre><br />And then
        of course, you still get the error message.... &nbsp; But if you click through it after installing those
        packages it seems to go a hell of a lot faster, so I think I might have accomplished something.<br /><br />The
        other weird thing is the permissions on the files when mounted automatically (for instance, while logged into
        gnome). &nbsp;If you get permission denied errors running the installer script you can copy the contents of the
        cdrom to ~/parallels, chmod -R +x ~/parallels, and then run "sudo bash ~/parallels/install".<br /><br /><br />
    </div>
</div>