
# Frequency Analysis

Coding Exercise

Goal: Build a webapp that performs simple frequency analysis on a user-supplied text document.

| Language   | Framework     | Database   |
| ---------- |:-------------:| ----------:|
| *Ruby*     | *Sinatra*     | *Postgres* |


Special Gems Used: *docx*, *carrierwave*, and *simplecov*

The docx gem is used to make it simpler to interact with docx files while the carrierwave gem allows for uploading of files; in this case it would be documents. The simplecov gem is a testing coverage tool to see how much code the tests cover. 

The first page allows for the uploading of the docx file. The next page actually shows the analysis. The first thing you see is a table with the top 25 words in the document along with the occurences of the word in the document. Below the table you will see the full text of the document. 

The software architectural pattern used for the user interface was the traditional model-view-controller. The model is where the behavior of the application is written. The logic, rules, and management of data is done here. The view is where the output for th application is generated. The templating system used was embedded Ruby - ruby embedded into a html document. The controller accepts input and converts it to commands for the model or view. 

The Document parsing is done in the Document model via the methods controlled by the controller index file. The word parsing and hence the algorithms to extract the stems from the words is done in the Word model methods. 

Extracting the stems involved first deleting the suffixes that were common and then deleting the s for pluralized words. The stemming algorithm could potentially be much more complex and grab more possibilities. 

The framework for behavior driven development of the application is RSpec. There are 12 examples/tests, 0 failures. 










