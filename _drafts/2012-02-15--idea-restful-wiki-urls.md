--- layout: post title: "\*IDEA\* RESTful Wiki URLs" date: 2012-02-15
comments: false ---

Typical Wiki URLs:\
\
\

-   /SomePage
-   /edit/SomePage

Encoding the verb in the URL isn't RESTful.  Maybe build a simple Wiki
that uses javascript and POST, PUT, or PATCH verbs properly to handle
updates to a resource.

\

Other options:

\

You could also make the editor a real resource:

-   /SomePage
-   /Editor?page=SomePage

You could make editing an option GET:

-   /SomePage
-   /SomePage?mode=edit

Edit shows you the same page content but in a viewable form.  Clicking
submit uses post/put/patch and updates the content of the Wiki page.

\

I think the restful option is actually using ?view=editor / ?mode=edit
to edit the page.  It means that an edit link on a page just needs to
add "?query=param" to the current location.  It also means that you have
a single canonical URL for a resource rather than having "/SomePage" and
"/edit/SomePage" all over the place.

\

\

