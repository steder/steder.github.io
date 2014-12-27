---
layout: post
title: "Software Illustrated: I'm just trying to change this lightbulb"
date: 2014-11-14 07:03
comments: true
categories: engineering management gifs software illustrated
---

# The GIF

I like to think that I'm an GIF afficionado, but it's hard to overstate how much this GIF can help one understand about software engineering.

Let it wash over you.  Watch it a few times.

![a_simple_problem](/gifs/im_just_trying_to_change_this_lightbulb.gif)

# Just the facts

- Hal enters, walks to the kitchen and immediately tries to turn on a light in the kitchen
- Hal turns it off and on again
- Hal check the bulb and decides it needs to be replaced
- Hal goes to a kitchen cabinent to get a bulb
- As he's reaching for the bulb he notes the shelf is loose
- Hal decides to fix the shelf and opens a drawer to get a screwdriver
- The drawer squeaks so Hal decides to get WD-40 to fix the squeak
- The WD-40 is empty so Hal decides to drive tot he store to get some more
- His car won't start
- Hal decides to fix the car
- Lois comes home and asks Hal to please drop what he's doing and fix the lightbulb in the kitchen
- Hal exclaims that that's what he's currently trying to do by fixing the car

# Technical Debt

{% pullquote %}
Hal and Lois just illustrated for us what software people like to call "Technical Debt".
Technical debt conceptually leans very heavily on the financial concept of debt.  {" Essentially,
you accumulate technical debt by taking short cuts or not fixing problems when they occur. "}  Deferring fixing
bugs or avoiding building a feature the "right way" either by ignoring best practices or cutting corners in
the system to hit a target date forces you to essentially mortage your code base and take on "Tecnical Debt".
{% endpullquote %}

Some software issues are incorrectly interpreted as debt.  For example, bugs in your software are not necessarily debt.  Some bugs can exist for years and are a non-issue.  Some people think something is a bug when it's really a feature of the system.  Some bugs occur only infrequently or no one knows how they bug should really be fixed.  While these are frustrating, they generally not issues of debt.

Instead, technical debt is typically design decisions that were made in the name of expediency that you may or may not have realized would cause problems down the line.  Sadly, expereienced engineers sometimes incur this debt despite the fact they know it will eventually be a problem because:

 - I'll rewrite it before we get enough customers that scalability will be an issue
 - I'll fix it after RELEASE_DATE/CUSTOMER_DEMO when we finally have some time to do things right
 - I'll fix it before I leave the company
 - No one cares about quality

Examples of some design decisions and tradeoffs that may create debt:

 - We'll write the kernel of the application in a "scripting" language and optimize later, if at all
 - We'll deploy this by hand
 - We'll use an ORM to do data access because we don't know SQL
 - We'll stop fixing bugs in this OLD_THING while we replatform to the NEW_THING

# Us versus them?

Typically any software system has some amount of technical debt so it's not always clear when that debt becomes a serious problem for your company or team.

Part of what makes technical debt challenging is that software people and business people within your organization likely look at the priority of paying down technical debt completely differently.

For example, if Hal is a typical software person on your team, from his perspective he's trying to finish the project "Have working kitchen lights" as quickly as possible while following the boyscout rule and at each step of the process leaving the camp site nicer than it was when he arrived.  In this case, that means fixing the loose shelf in kitchen cabinent, fixing the squeaky drawer, the car, etc.

Assuming Lois is our CEO, she's really confused by this behavior.  She's thinking, that kitchen light is critical for the business and needs to be completed as soon as possible so other work can proceed, a new client can be signed, etc.  Any delay for minor issues like loose shelves or squeaky drawers seems like a complete waste.  Lois can completely understand the emergency car fix, but she's still confused as to why that's necessary now to simply change the lightbulb.

From an engineering perspective folks look at Hal's odyssey to change a lightbulb and they laugh wryly, or sigh deeply and think "I've lived through days or weeks like that where I'm just trying to complete a simple task but 'Technical Debt' and other roadblocks prevented me from making progress."

From a management perspective, folks just look at a team of software engineers that are inexplicably taking forever to accomplish a seemingly simple task. They question if they have the right people, if they need a new team, additional resources, or even worse, a replatform.

First of all, let's look at why software folks behave this way.

## Engineer Perspective

Engineers think a number of things that are all somewhat true and attempt to overcompensate for those things with this sort of extreme-Hal behavior:

1. I want to do a quality job and this isn't good enough.  If only I had more time!
2. I don't think my boss will care about this.  If I ask them to prioritize it they'll tell me not to work on it.
3. If they won't let me work on it now they'll never let me work on it and It'll never be fixed! (keeps, creates debt)
4. Our code base is already full of bugs, I don't want to create more or do more maintenance work in the future.
5. Bugs cost us too much already in terms of maintenance and lost customers/sales, we have to improve quality (pay down debt)

Now what's true from an Engineering perspective is that this bug is likely not important enough to tackle right now and that it should be prioritized.

What hopefully isn't true in your business is that no-one will ever care about this issue and that it will never be fixed.  Instead, I hope you periodically address technical issues brought up during prioritized work and you fix bugs like "Loose shelf in kitchen cabinent".

## Business Perspective

Business folks of course are more concerned about time to market and really are just looking at everything being done as quickly as possible so that whatever is contingent on the work being complete can proceed.

Business folks think the following things that are also somewhat true:

1. Quality can slip a "little bit" to hit target dates (it's okay to take on debt to make a sale)
2. I'm not sure I trust the software people with their computer wizardry
3. In previous situations they were able to hit the date despite saying they couldn't, they just need to work harder
4. This is the most important project at the company and they are the highest paid people, it's okay if they work harder

Yes, quality can slip a little bit to hit a date, and yes, the project is likely important and yes, you likely pay these software folks quite well compared to other roles in your company.

However, a lack of trust is not really a good reason to assume that your software group is dragging their feet and despite the high pay, sometimes equipment and resources are still an issue.  Perhaps better IT infrasture, better tools, or additional personnel could complete a project more quickly and if something is truly that important to your business perhaps spending more money to acquire additional resources is the answer.

Fortunately, business people actually have a good understanding of debt and borrowing.  Unfortunately, they likely don't have the technical expertise to understand if the debt they've accumulated is a little or a lot.  Determining the amount of debt the business has is something that requires a good working relationship, even trust, between the business and engineering sides of an organization.

# Addressing Technical Debt

The path towards responsible tech debt financials lies somewhere between these two view points.  Typically the business side and software side are both looking out for the best interests of the business or project of which they're a member.  I think that the appropriate response to the presence of technical
debt on your team is the following:

1. Carve out a portion of your software teams time to pay down technical debt.  You want to pay down as much as you can to address some of the principle part of the loan, so that you are not just paying down interest.  To do this I advocate treating your engineering / software team as an equal
stakeholder in the business in terms of time allocated.

For example, if you currently work on 4 projects at a time, one for each of 4 business units at your company, you first need to recognize that there are actually 5 "real" projects you need to be able to tackle and that a portion of hours from the 4 projects needs to be allocated to this fifth, home improvement project.

e.g.: 

    if you're currently allocating 25 hours a week to each of the four projects, I'd reduce each of thsoe projects hours from 25 to 20 and run 5 projects at 20 hours a piece.

2. Prioritize technical debt tasks.  Estimate them and treat them like real work.  The only thing really different is that the stakeholder for this work is the engineers, not some customer or project manager elsewhere in your company.

3. Create a "home improvement" rotation or otherwise allocate this work to memebers of your software team.

4. Demo this debt retirement work to your software team, and where appropriate, to the rest of the business.  Better quality, faster, and/or easier to use features should be relevant to all and something that should be recognized and positively reinforced.

## Vol 1, Issue 1:

Software Engineering Illustrated is my attempt to combine my love of GIFs
with my love of solving problems with computers.
