# freqanalysis

Coding Exercise

Goal: Build a webapp that performs simple frequency analysis on a user-supplied text document.

The application should accept a text document from the user, count how often each word is used in it, and report the top 25 most frequently used.

In order to make the results more useful, the analysis should extract the stems of the words so that different inflections of the same word are all counted in the same bucket. Use the following categories when stemming:

Regularly conjugated english verbs. For example, consider "talk", "talks", "talking", and "talked" to all be forms of "talk".
Regularly pluralized english nouns. For example, consider "cat" and "cats" to be forms of "cat".

Please write the stemming algorithm yourself, instead of using an existing code library. The results should be supplied to the user in a friendly and attractive web page.

Use whatever language and framework(s) you find familiar and appropriate to the task. When you're satisfied with your solution, submit:

The code
A README that gives an overview of your solution and libraries/frameworks you used
