---
layout: post
title: "Editing Source File in Emacs with DOS line endings"
date: 2011-03-04
comments: false
---

<div class='post'>
    <span class="Apple-style-span" style="font-family: 'Arial Unicode MS', 'DejaVu Sans', sans-serif;">While editing a
        source file in Emacs with DOS line endings I've got a little voice in the back of my head buzzing that I should
        really convert those line endings...</span><br /><span class="Apple-style-span"
        style="font-family: 'Arial Unicode MS', 'DejaVu Sans', sans-serif;"><br /></span><br /><span
        class="Apple-style-span" style="font-family: 'Arial Unicode MS', 'DejaVu Sans', sans-serif;">Anyway, I found a
        painless way to do that conversion within Emacs:</span><br /><span class="Apple-style-span"
        style="font-family: 'Arial Unicode MS', 'DejaVu Sans', sans-serif;"><br /></span><br /><span
        class="Apple-style-span" style="font-family: 'Arial Unicode MS', 'DejaVu Sans', sans-serif;">M-x
        set-buffer-file-coding-system</span><br /><span class="Apple-style-span"
        style="font-family: 'Arial Unicode MS', 'DejaVu Sans', sans-serif;">At the prompt enter:
        "unix"&nbsp;</span><br /><span class="Apple-style-span"
        style="font-family: 'Arial Unicode MS', 'DejaVu Sans', sans-serif;"><br /></span><br /><span
        class="Apple-style-span" style="font-family: 'Arial Unicode MS', 'DejaVu Sans', sans-serif;"><br /></span></div>