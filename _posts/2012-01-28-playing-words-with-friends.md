---
layout: post
title: "Playing Words with Friends"
date: 2012-01-28
comments: false
categories:
- python
- programming
- gaming
---

<div class='post'>
    <span style="font-family: inherit; font-size: large;">Words with Friends</span><br /><span
        style="font-family: inherit;"><a href="http://www.wordswithfriends.com/">Words with Friends</a>, if you're not
        already familiar, is a game of Scrabble that lets you play asynchronously with friends over the
        internet.</span><br /><span style="font-family: inherit;"><br /></span><br /><span
        style="font-family: inherit;">I recently started playing WoF because I like to think I have a large vocabulary
        and rarely get the opportunity to use it. &nbsp;I also enjoy playing boardgames like Scrabble but between work
        and ... sleep... I don't often get the chance to get together with my friends and play </span><a
        href="http://boardgamegeek.com/boardgame/24508/taluva" style="font-family: inherit;">Taluva </a><span
        style="font-family: inherit;">into the wee hours.</span><br /><span
        style="font-family: inherit;"><br /></span><br /><span style="font-family: inherit;">Anyway, I have a confession
        to make.</span><br /><span style="font-family: inherit;"><br /></span><br /><span
        style="font-family: inherit; font-size: large;">I'm terrible at Words with Friends</span><br /><span
        style="font-family: inherit;">Whenever it is my turn I look at my hand of letters: &nbsp;</span><span
        style="font-family: inherit;">ILNIREE</span><br /><span style="font-family: inherit;">And think:
        &nbsp;</span><span style="font-family: inherit;">ILNIREE is not a word. &nbsp;Darn.</span><br /><span
        style="font-family: inherit;">And then I start to mentally rearrange letters to see if I can make other words.
        &nbsp;WoF's conveniently includes a "Shuffle" button so I hit that a few times... &nbsp;And while given enough
        time I do come up with a word a few things bug me about this process.</span><br /><span
        style="font-family: inherit;">First of all, years of Google and Wikipedia use have atrophied important muscles
        like "memory". &nbsp;Second, i'm a programmer and that means:</span><br /><span
        style="font-family: inherit;"><br /></span><br /><span
        style="font-family: inherit; font-size: large;">Laziness<sup>1</sup></span><br /><span
        style="font-family: inherit;">Basically shuffling letters and checking or guessing that they are words is a
        perfectly straightforward although not terribly efficient way to try to optimize your scrabble game. &nbsp;Of
        course, it's got a lot of drawbacks if you try to do it by hand. &nbsp;It's slow and it's uninteresting.
        &nbsp;To try to find every word possible with any of your 7 letters you'd need to try all permutations and there
        are over 10,000 permutations of 7 letters. &nbsp;</span><br /><br /><span style="font-family: inherit;">Anyway,
        I'm bad at Words with Friends but I like programming so once I started playing WoF of course I gravitated
        towards...</span><br /><span style="font-family: inherit;"><br /></span><br /><span
        style="font-family: inherit; font-size: large;">Solving Words with Friends<sup>2</sup></span><br /><span
        style="font-family: inherit;">Boring and repetitive work is exactly what computers are good at it! &nbsp;In fact
        the Python program to generate all possible permutations of 7 letters (1 letter words, 2 letter words, 3 letter
        words, etc) is pretty straightforward especially with a little help from our friend <a
            href="http://docs.python.org/library/itertools.html">itertools</a>.</span><br /><span
        style="font-family: inherit;">My first and simplest attempt involved putting the contents of the standard unix
        dictionary (/usr/share/dict/words) into a python dictionary (an excellent hash table
        implementation).&nbsp;</span><br />This isn't exactly what I came up with first but it should illustrate what
    I'm talking about:<br />
    <script src="https://gist.github.com/1653998.js?file=words_simple.py"></script><br /><br />Of course you end up
    looking at a lot of permutations for 7 letters (~13 thousand) so this can take a little while. It's still not slow
    on any reasonable computer but when you start adding in other letters to try and find words that might fit in with
    available spots on the board things can slow down. For example, say you could play words that begin with t, l, or r.
    Running the above getScrabbleLetters function for 10 letters requires you to check&nbsp;9,864,101 permutations.
    <br /><br />Worse still, if you add in the notion of wildcards (9 letters plus some character like '*' to represent
    a wildcard) you end up repeating those over 9 million lookups 26 times to check all the other possible letters of
    the alphabet in the wildcard slot. &nbsp;That's over 250 million dictionary lookups to find a fairly small list of
    unique words.<br /><br />However, if we step back for a moment and think about anagrams, a simple tweak can help
    process larger strings (and strings with wildcards) much more quickly.<br /><br />Imagine you've got a couple
    anagrams like "was" and "saw". &nbsp;They've got the same letters but count as two different words in our dictionary
    and require two separate lookups. &nbsp;If we shift our perspective a little bit and start thinking about the
    letters as what's important we get some very nice performance improvements.<br /><br />We still use a hash table as
    our primary data structure but instead of using the words as the keys we use the sorted letters of a word as the
    key. &nbsp;The values become lists of all the words which include those same letters. &nbsp;It's a little bit more
    work to insert, as we first have to calculate what the key would be, and it's a little more work to lookup, as we
    have to iterate over the list of possible words. &nbsp;But it's great any time we care just about anagrams and it's
    much more efficient in terms of the number of lookups required to find all the scrabble words. &nbsp;For example,
    for the same 10 letter case from earlier we now need only&nbsp;1024 lookups. &nbsp;~26 thousand lookups for the
    wildcard case.<br /><br />Without further ado that solution looks like this:<br /><br />
    <script src="https://gist.github.com/1653998.js?file=sorted.py"></script> <br /><br />One other really useful bit is
    a quick way to look for all the words that have a given suffix or prefix. This is a little trickier than the anagram
    case but it's also more interesting because I got to spend a little time reading about a new data structure, a Trie.
    A Trie is a tree-like structure optimized for storing strings. &nbsp;The root node of the tree represents the empty
    string and each of its children represents the first letter of a word. &nbsp;Every child of these nodes is the next
    letter in a word starting with that substring. &nbsp;<span
        style="font-family: inherit;"><br /></span><br /><br />For example, a trie of nodes for the words "an apple yum"
    would look like:<br />
    <div class="separator" style="clear: both; text-align: center;"><a
            href="/imagestrie.png"
            imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" height="320"
                src="/imagestrie.png"
                width="163" /></a></div><br />So the trie solution for finding words that begin with a certain prefix
    is:<br /><br />
    <script src="https://gist.github.com/1653998.js?file=trie.py"></script> <br /><br />The suffix version is just a
    couple more lines with judicious use of the <a
        href="http://docs.python.org/library/functions.html#reversed">reversed</a> function.<br /><br /><span
        style="font-size: large;">Conclusion and Next Steps</span><br />I think that Words with Friends is a lot more
    fun now that I have my computer as a crutch. &nbsp;I've enjoyed playing with some simple algorithms for finding
    algorithms and looking up strings.<br /><br />My next steps after today are going to be putting up my utilities here
    on my website so that I can share them with my non-programmer friends. &nbsp;Building a simple web service for
    solving/cheating at scrabble is a hopefully interesting topic in its own right so building that will probably be my
    next blog post.<br /><br />After that I'm interested in taking this to its logical conclusion and actually building
    (and blogging about) a scrabble solver where you can enter in the whole state of the scrabble board and your hand
    and have it tell you all your possible moves (or at least the subset of moves that give you higher
    scores).<br /><br />If you made it this far you might be interested in the actual tested source code <a
        href="https://github.com/steder/words">here on github</a>.<br /><br /><span
        style="font-family: inherit;">1</span><br />
    <dl>
        <dd><span style="font-family: inherit;"><a href="http://en.wikipedia.org/wiki/Larry_Wall">Larry
                    Wall</a>&nbsp;calls this the first great virtue of a programmer. &nbsp;</span></dd>
        <dt>2</dt>
        <dd>Perhaps a more honest heading here would be "Cheating at Words With Friends" :-)</dd> <span
            style="font-family: inherit;"></span>
        <div>
            <div><span style="font-family: inherit;"></span></div><span style="font-family: inherit;"> </span>
        </div>
    </dl>
</div>